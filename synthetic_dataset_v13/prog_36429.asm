; DESCRIPTION: Composite: Renders a blue box of size 116x74 starting at (9, 113) then Places a magenta dot at position (447, 174).
; PLAN: r0=9(x), r1=113(y), r2=116(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=174(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 9
LDI r1, 113
LDI r2, 116
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 174
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
