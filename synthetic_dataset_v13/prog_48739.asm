; DESCRIPTION: Places a black 46x73 rectangle at position (371, 136).
; PLAN: r0=371(x), r1=136(y), r2=46(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 136
LDI r2, 46
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
