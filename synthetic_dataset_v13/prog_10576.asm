; DESCRIPTION: Renders a blue box of size 78x109 starting at (127, 29).
; PLAN: r0=127(x), r1=29(y), r2=78(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 29
LDI r2, 78
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
