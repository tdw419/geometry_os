; DESCRIPTION: Composite: Places a white line segment connecting (380, 29) to (359, 181) then Creates a magenta circular shape at (320, 71) with radius 60 then Sets a single cyan pixel at (307, 227).
; PLAN: r0=380(x1), r1=29(y1), r2=359(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=71(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=307(x), r11=227(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 29
LDI r2, 359
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 71
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 307
LDI r11, 227
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
