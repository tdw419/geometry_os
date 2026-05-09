; DESCRIPTION: Renders a magenta box of size 22x113 starting at (338, 50).
; PLAN: r0=338(x), r1=50(y), r2=22(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 50
LDI r2, 22
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
