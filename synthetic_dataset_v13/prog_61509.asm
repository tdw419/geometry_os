; DESCRIPTION: Renders a blue box of size 22x38 starting at (438, 132).
; PLAN: r0=438(x), r1=132(y), r2=22(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 132
LDI r2, 22
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
