; DESCRIPTION: Places a red 43x27 rectangle at position (57, 116).
; PLAN: r0=57(x), r1=116(y), r2=43(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 116
LDI r2, 43
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
