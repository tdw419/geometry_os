; DESCRIPTION: Renders a yellow box of size 59x120 starting at (29, 48).
; PLAN: r0=29(x), r1=48(y), r2=59(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 48
LDI r2, 59
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
