; DESCRIPTION: Places a yellow 25x69 rectangle at position (402, 46).
; PLAN: r0=402(x), r1=46(y), r2=25(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 46
LDI r2, 25
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
