; DESCRIPTION: Composite: Renders a orange box of size 25x56 starting at (350, 200) then Places a blue circle of radius 33 at center (430, 55).
; PLAN: r0=350(x), r1=200(y), r2=25(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=55(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 350
LDI r1, 200
LDI r2, 25
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 55
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
