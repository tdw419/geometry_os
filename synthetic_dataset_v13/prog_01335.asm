; DESCRIPTION: Places a blue 113x96 rectangle at position (133, 46).
; PLAN: r0=133(x), r1=46(y), r2=113(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 46
LDI r2, 113
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
