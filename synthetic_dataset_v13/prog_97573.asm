; DESCRIPTION: Places a blue 25x76 rectangle at position (124, 46).
; PLAN: r0=124(x), r1=46(y), r2=25(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 46
LDI r2, 25
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
