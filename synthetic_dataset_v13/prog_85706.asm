; DESCRIPTION: Renders a magenta box of size 115x55 starting at (149, 187).
; PLAN: r0=149(x), r1=187(y), r2=115(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 187
LDI r2, 115
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
