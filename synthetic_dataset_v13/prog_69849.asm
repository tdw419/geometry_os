; DESCRIPTION: Renders a magenta box of size 46x88 starting at (320, 127).
; PLAN: r0=320(x), r1=127(y), r2=46(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 127
LDI r2, 46
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
