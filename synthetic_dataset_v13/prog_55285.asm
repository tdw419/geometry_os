; DESCRIPTION: Composite: Renders a white disk with center (240, 91) and radius 70 then Renders a yellow box of size 68x32 starting at (244, 52).
; PLAN: r0=240(x), r1=91(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=52(y), r7=68(width), r8=32(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 91
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 52
LDI r7, 68
LDI r8, 32
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
