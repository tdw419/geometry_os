; DESCRIPTION: Renders a magenta box of size 22x18 starting at (161, 153).
; PLAN: r0=161(x), r1=153(y), r2=22(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 153
LDI r2, 22
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
