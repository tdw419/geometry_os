; DESCRIPTION: Renders a yellow box of size 14x83 starting at (95, 28).
; PLAN: r0=95(x), r1=28(y), r2=14(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 28
LDI r2, 14
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
