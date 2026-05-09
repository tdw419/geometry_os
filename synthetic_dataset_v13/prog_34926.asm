; DESCRIPTION: Renders a blue box of size 19x44 starting at (398, 149).
; PLAN: r0=398(x), r1=149(y), r2=19(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 149
LDI r2, 19
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
