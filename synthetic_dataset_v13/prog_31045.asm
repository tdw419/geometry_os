; DESCRIPTION: Renders a yellow box of size 16x92 starting at (233, 142).
; PLAN: r0=233(x), r1=142(y), r2=16(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 142
LDI r2, 16
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
