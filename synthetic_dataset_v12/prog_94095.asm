; DESCRIPTION: Renders a blue box of size 25x70 starting at (123, 186).
; PLAN: r0=123(x), r1=186(y), r2=25(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 186
LDI r2, 25
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
