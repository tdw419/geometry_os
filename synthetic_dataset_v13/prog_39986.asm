; DESCRIPTION: Renders a blue box of size 28x11 starting at (268, 8).
; PLAN: r0=268(x), r1=8(y), r2=28(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 8
LDI r2, 28
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
