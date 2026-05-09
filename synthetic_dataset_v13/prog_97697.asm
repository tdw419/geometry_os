; DESCRIPTION: Renders a green box of size 106x56 starting at (3, 15).
; PLAN: r0=3(x), r1=15(y), r2=106(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 15
LDI r2, 106
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
