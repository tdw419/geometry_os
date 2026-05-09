; DESCRIPTION: Composite: Renders a yellow line between points (92, 16) and (429, 88) then Creates a magenta circular shape at (239, 129) with radius 59.
; PLAN: r0=92(x1), r1=16(y1), r2=429(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=129(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 92
LDI r1, 16
LDI r2, 429
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 129
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
