; DESCRIPTION: Composite: Renders a black line between points (70, 64) and (367, 184) then Renders a magenta disk with center (336, 124) and radius 37.
; PLAN: r0=70(x1), r1=64(y1), r2=367(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=124(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 64
LDI r2, 367
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 124
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
