; DESCRIPTION: Composite: Renders a magenta line between points (139, 119) and (509, 220) then Renders a purple box of size 65x11 starting at (6, 23).
; PLAN: r0=139(x1), r1=119(y1), r2=509(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=23(y), r7=65(width), r8=11(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 119
LDI r2, 509
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 23
LDI r7, 65
LDI r8, 11
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
