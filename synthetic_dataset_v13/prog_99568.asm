; DESCRIPTION: Renders a blue box of size 45x16 starting at (465, 31).
; PLAN: r0=465(x), r1=31(y), r2=45(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 31
LDI r2, 45
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
