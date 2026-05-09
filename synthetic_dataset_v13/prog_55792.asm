; DESCRIPTION: Renders a magenta box of size 45x58 starting at (313, 54).
; PLAN: r0=313(x), r1=54(y), r2=45(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 54
LDI r2, 45
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
