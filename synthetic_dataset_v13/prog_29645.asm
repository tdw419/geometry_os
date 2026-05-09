; DESCRIPTION: Places a green 87x29 rectangle at position (379, 69).
; PLAN: r0=379(x), r1=69(y), r2=87(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 69
LDI r2, 87
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
