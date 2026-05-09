; DESCRIPTION: Renders a blue box of size 101x65 starting at (387, 109).
; PLAN: r0=387(x), r1=109(y), r2=101(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 109
LDI r2, 101
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
