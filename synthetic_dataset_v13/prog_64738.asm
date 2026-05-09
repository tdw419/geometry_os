; DESCRIPTION: Composite: Draws a cyan line from (188, 119) to (342, 213) then Places a cyan dot at position (50, 198).
; PLAN: r0=188(x1), r1=119(y1), r2=342(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=198(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 119
LDI r2, 342
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 198
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
