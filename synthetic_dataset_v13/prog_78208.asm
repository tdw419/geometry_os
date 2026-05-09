; DESCRIPTION: Places a blue 117x46 rectangle at position (369, 66).
; PLAN: r0=369(x), r1=66(y), r2=117(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 66
LDI r2, 117
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
