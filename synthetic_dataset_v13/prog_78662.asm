; DESCRIPTION: Places a magenta 116x78 rectangle at position (368, 143).
; PLAN: r0=368(x), r1=143(y), r2=116(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 143
LDI r2, 116
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
