; DESCRIPTION: Composite: Places a red dot at position (16, 132) then Draws a green line from (306, 209) to (434, 123).
; PLAN: r0=16(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=209(y1), r7=434(x2), r8=123(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 16
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 306
LDI r6, 209
LDI r7, 434
LDI r8, 123
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
