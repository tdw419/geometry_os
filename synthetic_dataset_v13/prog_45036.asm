; DESCRIPTION: Renders a yellow box of size 63x69 starting at (371, 39).
; PLAN: r0=371(x), r1=39(y), r2=63(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 39
LDI r2, 63
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
