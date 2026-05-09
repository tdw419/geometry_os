; DESCRIPTION: Renders a blue box of size 18x99 starting at (487, 44).
; PLAN: r0=487(x), r1=44(y), r2=18(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 44
LDI r2, 18
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
