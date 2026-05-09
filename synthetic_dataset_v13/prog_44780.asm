; DESCRIPTION: Renders a magenta box of size 117x22 starting at (140, 174).
; PLAN: r0=140(x), r1=174(y), r2=117(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 174
LDI r2, 117
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
