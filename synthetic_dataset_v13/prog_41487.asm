; DESCRIPTION: Composite: Renders a yellow box of size 105x11 starting at (64, 13) then Renders a orange disk with center (220, 68) and radius 10.
; PLAN: r0=64(x), r1=13(y), r2=105(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=68(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 13
LDI r2, 105
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 68
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
