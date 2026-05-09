; DESCRIPTION: Composite: Places a black 71x72 rectangle at position (198, 76) then Creates a red circular shape at (293, 121) with radius 77.
; PLAN: r0=198(x), r1=76(y), r2=71(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x), r6=121(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 76
LDI r2, 71
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 121
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
