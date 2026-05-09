; DESCRIPTION: Composite: Renders a purple box of size 53x108 starting at (45, 27) then Renders a blue line between points (324, 112) and (175, 11).
; PLAN: r0=45(x), r1=27(y), r2=53(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x1), r6=112(y1), r7=175(x2), r8=11(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 27
LDI r2, 53
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 112
LDI r7, 175
LDI r8, 11
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
