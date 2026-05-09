; DESCRIPTION: Composite: Renders a magenta line between points (360, 218) and (431, 96) then Renders a yellow disk with center (273, 194) and radius 57.
; PLAN: r0=360(x1), r1=218(y1), r2=431(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=273(x), r6=194(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 218
LDI r2, 431
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 194
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
