; DESCRIPTION: Renders a magenta box of size 46x39 starting at (161, 89).
; PLAN: r0=161(x), r1=89(y), r2=46(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 89
LDI r2, 46
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
