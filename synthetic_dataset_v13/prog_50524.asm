; DESCRIPTION: Places a green 87x26 rectangle at position (277, 88).
; PLAN: r0=277(x), r1=88(y), r2=87(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 88
LDI r2, 87
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
