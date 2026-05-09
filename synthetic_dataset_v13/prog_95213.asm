; DESCRIPTION: Renders a blue box of size 48x87 starting at (151, 109).
; PLAN: r0=151(x), r1=109(y), r2=48(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 109
LDI r2, 48
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
