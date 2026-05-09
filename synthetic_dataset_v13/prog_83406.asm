; DESCRIPTION: Places a purple 42x77 rectangle at position (426, 53).
; PLAN: r0=426(x), r1=53(y), r2=42(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 53
LDI r2, 42
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
