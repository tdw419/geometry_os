; DESCRIPTION: Places a green 69x27 rectangle at position (78, 116).
; PLAN: r0=78(x), r1=116(y), r2=69(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 116
LDI r2, 69
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
