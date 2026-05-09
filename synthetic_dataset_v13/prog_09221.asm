; DESCRIPTION: Composite: Places a black circle of radius 56 at center (334, 67) then Renders a yellow box of size 50x96 starting at (10, 80).
; PLAN: r0=334(x), r1=67(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x), r6=80(y), r7=50(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 67
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 80
LDI r7, 50
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
