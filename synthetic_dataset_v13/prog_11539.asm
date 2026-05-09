; DESCRIPTION: Renders a purple box of size 28x67 starting at (105, 154).
; PLAN: r0=105(x), r1=154(y), r2=28(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 154
LDI r2, 28
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
