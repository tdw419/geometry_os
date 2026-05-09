; DESCRIPTION: Renders a blue box of size 47x105 starting at (279, 56).
; PLAN: r0=279(x), r1=56(y), r2=47(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 56
LDI r2, 47
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
