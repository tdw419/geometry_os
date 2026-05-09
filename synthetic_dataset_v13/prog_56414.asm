; DESCRIPTION: Renders a yellow box of size 95x55 starting at (66, 23).
; PLAN: r0=66(x), r1=23(y), r2=95(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 23
LDI r2, 95
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
