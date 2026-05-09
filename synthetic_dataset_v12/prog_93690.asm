; DESCRIPTION: Renders a blue box of size 102x64 starting at (89, 187).
; PLAN: r0=89(x), r1=187(y), r2=102(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 187
LDI r2, 102
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
