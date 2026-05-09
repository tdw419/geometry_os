; DESCRIPTION: Composite: Places a magenta line segment connecting (401, 19) to (183, 72) then Renders a black disk with center (258, 140) and radius 65.
; PLAN: r0=401(x1), r1=19(y1), r2=183(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=140(y), r7=65(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 401
LDI r1, 19
LDI r2, 183
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 140
LDI r7, 65
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
