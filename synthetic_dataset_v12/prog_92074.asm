; DESCRIPTION: Places a magenta 116x93 rectangle at position (226, 144).
; PLAN: r0=226(x), r1=144(y), r2=116(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 144
LDI r2, 116
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
