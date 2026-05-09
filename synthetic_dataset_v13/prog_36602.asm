; DESCRIPTION: Renders a blue box of size 47x46 starting at (431, 83).
; PLAN: r0=431(x), r1=83(y), r2=47(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 83
LDI r2, 47
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
