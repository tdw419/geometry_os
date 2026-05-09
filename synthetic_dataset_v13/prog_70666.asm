; DESCRIPTION: Renders a magenta box of size 68x25 starting at (161, 92).
; PLAN: r0=161(x), r1=92(y), r2=68(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 92
LDI r2, 68
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
