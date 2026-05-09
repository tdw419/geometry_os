; DESCRIPTION: Composite: Creates a white circular shape at (392, 162) with radius 64 then Renders a green box of size 86x70 starting at (282, 136).
; PLAN: r0=392(x), r1=162(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=136(y), r7=86(width), r8=70(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 162
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 136
LDI r7, 86
LDI r8, 70
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
