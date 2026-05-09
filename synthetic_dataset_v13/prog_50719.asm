; DESCRIPTION: Renders a blue box of size 46x20 starting at (339, 146).
; PLAN: r0=339(x), r1=146(y), r2=46(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 146
LDI r2, 46
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
