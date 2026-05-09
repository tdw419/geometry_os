; DESCRIPTION: Composite: Renders a red box of size 116x118 starting at (293, 94) then Places a white dot at position (435, 255).
; PLAN: r0=293(x), r1=94(y), r2=116(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 94
LDI r2, 116
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
