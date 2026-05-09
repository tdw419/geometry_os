; DESCRIPTION: Composite: Renders a orange box of size 20x89 starting at (360, 92) then Places a cyan circle of radius 36 at center (422, 96).
; PLAN: r0=360(x), r1=92(y), r2=20(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=96(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 92
LDI r2, 20
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 96
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
