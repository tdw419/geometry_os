; DESCRIPTION: Places a green 116x62 rectangle at position (218, 103).
; PLAN: r0=218(x), r1=103(y), r2=116(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 103
LDI r2, 116
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
