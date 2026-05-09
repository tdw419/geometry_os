; DESCRIPTION: Renders a blue box of size 56x91 starting at (420, 27).
; PLAN: r0=420(x), r1=27(y), r2=56(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 27
LDI r2, 56
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
