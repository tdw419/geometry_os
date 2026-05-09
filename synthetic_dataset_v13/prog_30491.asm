; DESCRIPTION: Renders a blue box of size 33x77 starting at (421, 154).
; PLAN: r0=421(x), r1=154(y), r2=33(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 154
LDI r2, 33
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
