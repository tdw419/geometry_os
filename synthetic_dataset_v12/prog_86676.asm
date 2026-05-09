; DESCRIPTION: Places a green 88x27 rectangle at position (179, 40).
; PLAN: r0=179(x), r1=40(y), r2=88(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 40
LDI r2, 88
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
