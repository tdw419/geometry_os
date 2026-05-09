; DESCRIPTION: Renders a green box of size 55x56 starting at (9, 17).
; PLAN: r0=9(x), r1=17(y), r2=55(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 17
LDI r2, 55
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
