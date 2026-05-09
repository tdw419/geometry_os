; DESCRIPTION: Renders a blue box of size 30x33 starting at (313, 127).
; PLAN: r0=313(x), r1=127(y), r2=30(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 127
LDI r2, 30
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
