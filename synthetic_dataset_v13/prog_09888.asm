; DESCRIPTION: Composite: Renders a red box of size 116x32 starting at (206, 210) then Creates a blue circular shape at (262, 176) with radius 17.
; PLAN: r0=206(x), r1=210(y), r2=116(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=176(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 210
LDI r2, 116
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 176
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
