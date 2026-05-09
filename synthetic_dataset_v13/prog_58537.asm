; DESCRIPTION: Places a green 88x81 rectangle at position (183, 129).
; PLAN: r0=183(x), r1=129(y), r2=88(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 129
LDI r2, 88
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
