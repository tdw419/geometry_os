; DESCRIPTION: Composite: Renders a yellow box of size 110x34 starting at (30, 45) then Places a cyan circle of radius 69 at center (222, 166).
; PLAN: r0=30(x), r1=45(y), r2=110(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=166(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 30
LDI r1, 45
LDI r2, 110
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 166
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
