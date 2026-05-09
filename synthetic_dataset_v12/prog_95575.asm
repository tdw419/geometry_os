; DESCRIPTION: Composite: Renders a magenta disk with center (349, 152) and radius 63 then Places a yellow line segment connecting (335, 15) to (225, 32).
; PLAN: r0=349(x), r1=152(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x1), r6=15(y1), r7=225(x2), r8=32(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 349
LDI r1, 152
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 15
LDI r7, 225
LDI r8, 32
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
