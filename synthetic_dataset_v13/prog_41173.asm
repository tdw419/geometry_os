; DESCRIPTION: Places a cyan 87x116 rectangle at position (195, 136).
; PLAN: r0=195(x), r1=136(y), r2=87(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 136
LDI r2, 87
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
