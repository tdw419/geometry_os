; DESCRIPTION: Renders a magenta box of size 85x35 starting at (411, 127).
; PLAN: r0=411(x), r1=127(y), r2=85(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 127
LDI r2, 85
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
