; DESCRIPTION: Renders a blue box of size 38x30 starting at (333, 176).
; PLAN: r0=333(x), r1=176(y), r2=38(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 176
LDI r2, 38
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
