; DESCRIPTION: Renders a black box of size 63x120 starting at (163, 98).
; PLAN: r0=163(x), r1=98(y), r2=63(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 98
LDI r2, 63
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
