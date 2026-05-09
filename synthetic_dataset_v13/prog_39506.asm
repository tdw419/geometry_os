; DESCRIPTION: Renders a blue box of size 46x71 starting at (133, 167).
; PLAN: r0=133(x), r1=167(y), r2=46(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 167
LDI r2, 46
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
