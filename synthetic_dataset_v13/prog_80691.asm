; DESCRIPTION: Places a green 10x78 rectangle at position (407, 9).
; PLAN: r0=407(x), r1=9(y), r2=10(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 9
LDI r2, 10
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
