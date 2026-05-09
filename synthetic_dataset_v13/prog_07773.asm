; DESCRIPTION: Places a magenta 116x52 rectangle at position (204, 28).
; PLAN: r0=204(x), r1=28(y), r2=116(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 28
LDI r2, 116
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
