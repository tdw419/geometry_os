; DESCRIPTION: Composite: Draws a yellow line from (285, 126) to (301, 29) then Creates a cyan circular shape at (384, 144) with radius 32.
; PLAN: r0=285(x1), r1=126(y1), r2=301(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=384(x), r6=144(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 126
LDI r2, 301
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 384
LDI r6, 144
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
