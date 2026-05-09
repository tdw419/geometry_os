; DESCRIPTION: Renders a yellow box of size 12x120 starting at (359, 48).
; PLAN: r0=359(x), r1=48(y), r2=12(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 48
LDI r2, 12
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
