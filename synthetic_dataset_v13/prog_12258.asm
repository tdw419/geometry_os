; DESCRIPTION: Renders a magenta box of size 110x53 starting at (288, 46).
; PLAN: r0=288(x), r1=46(y), r2=110(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 46
LDI r2, 110
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
