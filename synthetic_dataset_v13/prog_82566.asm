; DESCRIPTION: Places a blue 116x85 rectangle at position (87, 171).
; PLAN: r0=87(x), r1=171(y), r2=116(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 171
LDI r2, 116
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
