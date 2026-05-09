; DESCRIPTION: Places a magenta 116x120 rectangle at position (214, 7).
; PLAN: r0=214(x), r1=7(y), r2=116(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 7
LDI r2, 116
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
