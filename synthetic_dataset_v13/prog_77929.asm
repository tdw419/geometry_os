; DESCRIPTION: Composite: Places a white circle of radius 54 at center (320, 128) then Renders a red box of size 58x37 starting at (446, 63) then Sets a single yellow pixel at (264, 117).
; PLAN: r0=320(x), r1=128(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=63(y), r7=58(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=264(x), r11=117(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 320
LDI r1, 128
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 63
LDI r7, 58
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 117
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
