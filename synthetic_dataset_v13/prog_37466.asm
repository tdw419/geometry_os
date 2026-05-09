; DESCRIPTION: Renders a yellow box of size 95x87 starting at (227, 57).
; PLAN: r0=227(x), r1=57(y), r2=95(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 57
LDI r2, 95
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
