; DESCRIPTION: Composite: Renders a cyan box of size 64x44 starting at (360, 140) then Places a red circle of radius 70 at center (338, 90).
; PLAN: r0=360(x), r1=140(y), r2=64(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=90(y), r7=70(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 140
LDI r2, 64
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 90
LDI r7, 70
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
