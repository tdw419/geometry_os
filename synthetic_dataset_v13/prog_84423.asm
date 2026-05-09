; DESCRIPTION: Places a blue 33x73 rectangle at position (65, 114).
; PLAN: r0=65(x), r1=114(y), r2=33(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 114
LDI r2, 33
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
