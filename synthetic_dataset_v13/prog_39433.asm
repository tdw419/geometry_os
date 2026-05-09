; DESCRIPTION: Places a green 73x55 rectangle at position (282, 188).
; PLAN: r0=282(x), r1=188(y), r2=73(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 188
LDI r2, 73
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
