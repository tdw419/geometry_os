; DESCRIPTION: Renders a blue box of size 46x52 starting at (210, 132).
; PLAN: r0=210(x), r1=132(y), r2=46(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 132
LDI r2, 46
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
