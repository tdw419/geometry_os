; DESCRIPTION: Renders a yellow box of size 105x54 starting at (46, 47).
; PLAN: r0=46(x), r1=47(y), r2=105(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 47
LDI r2, 105
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
