; DESCRIPTION: Renders a blue box of size 28x45 starting at (125, 109).
; PLAN: r0=125(x), r1=109(y), r2=28(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 109
LDI r2, 28
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
