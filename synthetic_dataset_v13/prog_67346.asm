; DESCRIPTION: Composite: Draws a red line from (137, 25) to (161, 209) then Places a cyan dot at position (310, 80).
; PLAN: r0=137(x1), r1=25(y1), r2=161(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=80(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 25
LDI r2, 161
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 80
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
