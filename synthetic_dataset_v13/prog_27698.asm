; DESCRIPTION: Renders a magenta box of size 26x60 starting at (152, 135).
; PLAN: r0=152(x), r1=135(y), r2=26(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 135
LDI r2, 26
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
