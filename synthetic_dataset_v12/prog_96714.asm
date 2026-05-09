; DESCRIPTION: Places a yellow 87x11 rectangle at position (32, 189).
; PLAN: r0=32(x), r1=189(y), r2=87(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 189
LDI r2, 87
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
