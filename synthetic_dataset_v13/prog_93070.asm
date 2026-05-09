; DESCRIPTION: Renders a blue box of size 53x56 starting at (202, 40).
; PLAN: r0=202(x), r1=40(y), r2=53(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 40
LDI r2, 53
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
