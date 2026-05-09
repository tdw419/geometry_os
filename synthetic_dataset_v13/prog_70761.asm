; DESCRIPTION: Renders a blue box of size 21x31 starting at (333, 173).
; PLAN: r0=333(x), r1=173(y), r2=21(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 173
LDI r2, 21
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
