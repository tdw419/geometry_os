; DESCRIPTION: Places a blue 113x118 rectangle at position (340, 123).
; PLAN: r0=340(x), r1=123(y), r2=113(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 123
LDI r2, 113
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
