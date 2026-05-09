; DESCRIPTION: Creates a red rectangular region at (263, 179) spanning 81 by 53 pixels.
; PLAN: r0=263(x), r1=179(y), r2=81(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 179
LDI r2, 81
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
