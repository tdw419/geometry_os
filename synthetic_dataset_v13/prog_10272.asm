; DESCRIPTION: Renders a magenta box of size 22x31 starting at (313, 168).
; PLAN: r0=313(x), r1=168(y), r2=22(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 168
LDI r2, 22
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
