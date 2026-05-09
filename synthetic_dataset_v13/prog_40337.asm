; DESCRIPTION: Renders a yellow box of size 29x74 starting at (176, 55).
; PLAN: r0=176(x), r1=55(y), r2=29(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 55
LDI r2, 29
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
