; DESCRIPTION: Composite: Renders a green box of size 109x30 starting at (170, 150) then Places a orange circle of radius 16 at center (495, 110).
; PLAN: r0=170(x), r1=150(y), r2=109(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x), r6=110(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 170
LDI r1, 150
LDI r2, 109
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 110
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
