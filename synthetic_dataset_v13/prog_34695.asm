; DESCRIPTION: Renders a magenta box of size 26x91 starting at (87, 113).
; PLAN: r0=87(x), r1=113(y), r2=26(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 113
LDI r2, 26
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
