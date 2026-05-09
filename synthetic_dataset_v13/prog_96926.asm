; DESCRIPTION: Renders a yellow box of size 77x103 starting at (220, 24).
; PLAN: r0=220(x), r1=24(y), r2=77(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 24
LDI r2, 77
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
