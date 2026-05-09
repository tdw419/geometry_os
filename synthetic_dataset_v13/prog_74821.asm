; DESCRIPTION: Places a purple 16x63 rectangle at position (116, 191).
; PLAN: r0=116(x), r1=191(y), r2=16(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 191
LDI r2, 16
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
