; DESCRIPTION: Places a blue 116x77 rectangle at position (208, 115).
; PLAN: r0=208(x), r1=115(y), r2=116(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 115
LDI r2, 116
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
