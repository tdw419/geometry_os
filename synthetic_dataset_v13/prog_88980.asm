; DESCRIPTION: Composite: Places a black line segment connecting (215, 8) to (108, 105) then Creates a white circular shape at (244, 61) with radius 42.
; PLAN: r0=215(x1), r1=8(y1), r2=108(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=61(y), r7=42(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 8
LDI r2, 108
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 61
LDI r7, 42
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
