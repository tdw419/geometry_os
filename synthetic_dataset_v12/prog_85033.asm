; DESCRIPTION: Composite: Renders a magenta disk with center (193, 67) and radius 42 then Draws a orange line from (169, 191) to (131, 211).
; PLAN: r0=193(x), r1=67(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x1), r6=191(y1), r7=131(x2), r8=211(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 67
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 191
LDI r7, 131
LDI r8, 211
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
