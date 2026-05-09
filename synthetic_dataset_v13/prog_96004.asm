; DESCRIPTION: Renders a blue box of size 46x89 starting at (165, 113).
; PLAN: r0=165(x), r1=113(y), r2=46(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 113
LDI r2, 46
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
