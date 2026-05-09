; DESCRIPTION: Composite: Places a red 116x42 rectangle at position (132, 141) then Places a purple circle of radius 74 at center (292, 113).
; PLAN: r0=132(x), r1=141(y), r2=116(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=292(x), r6=113(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 132
LDI r1, 141
LDI r2, 116
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 292
LDI r6, 113
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
