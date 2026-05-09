; DESCRIPTION: Composite: Renders a green box of size 102x71 starting at (189, 88) then Places a blue line segment connecting (473, 48) to (361, 130).
; PLAN: r0=189(x), r1=88(y), r2=102(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x1), r6=48(y1), r7=361(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 88
LDI r2, 102
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 48
LDI r7, 361
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
