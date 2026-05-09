; DESCRIPTION: Renders a black box of size 13x88 starting at (480, 132).
; PLAN: r0=480(x), r1=132(y), r2=13(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 132
LDI r2, 13
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
