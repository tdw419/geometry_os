; DESCRIPTION: Renders a magenta box of size 15x107 starting at (416, 29).
; PLAN: r0=416(x), r1=29(y), r2=15(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 29
LDI r2, 15
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
