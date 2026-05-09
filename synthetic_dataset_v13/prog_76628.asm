; DESCRIPTION: Composite: Places a cyan circle of radius 19 at center (488, 211) then Draws a magenta line from (490, 47) to (60, 24).
; PLAN: r0=488(x), r1=211(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=47(y1), r7=60(x2), r8=24(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 488
LDI r1, 211
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 47
LDI r7, 60
LDI r8, 24
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
