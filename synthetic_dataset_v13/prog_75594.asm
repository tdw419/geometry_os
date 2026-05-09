; DESCRIPTION: Renders a blue box of size 22x103 starting at (177, 14).
; PLAN: r0=177(x), r1=14(y), r2=22(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 14
LDI r2, 22
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
