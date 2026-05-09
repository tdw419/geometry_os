; DESCRIPTION: Renders a blue box of size 55x56 starting at (245, 134).
; PLAN: r0=245(x), r1=134(y), r2=55(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 134
LDI r2, 55
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
