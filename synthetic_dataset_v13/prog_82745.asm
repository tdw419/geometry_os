; DESCRIPTION: Places a green 71x16 rectangle at position (156, 116).
; PLAN: r0=156(x), r1=116(y), r2=71(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 116
LDI r2, 71
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
