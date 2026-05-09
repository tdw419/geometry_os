; DESCRIPTION: Renders a blue box of size 22x64 starting at (249, 36).
; PLAN: r0=249(x), r1=36(y), r2=22(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 36
LDI r2, 22
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
