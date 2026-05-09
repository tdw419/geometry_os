; DESCRIPTION: Composite: Places a yellow line segment connecting (295, 188) to (73, 230) then Creates a magenta circular shape at (403, 92) with radius 73.
; PLAN: r0=295(x1), r1=188(y1), r2=73(x2), r3=230(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=92(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 188
LDI r2, 73
LDI r3, 230
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 92
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
