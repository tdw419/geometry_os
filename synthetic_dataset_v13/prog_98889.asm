; DESCRIPTION: Places a red 42x112 rectangle at position (182, 116).
; PLAN: r0=182(x), r1=116(y), r2=42(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 116
LDI r2, 42
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
