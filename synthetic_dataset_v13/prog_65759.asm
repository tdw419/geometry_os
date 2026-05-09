; DESCRIPTION: Renders a blue box of size 99x16 starting at (393, 131).
; PLAN: r0=393(x), r1=131(y), r2=99(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 131
LDI r2, 99
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
