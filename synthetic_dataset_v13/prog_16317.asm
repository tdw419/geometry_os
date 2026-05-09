; DESCRIPTION: Renders a blue box of size 16x30 starting at (34, 139).
; PLAN: r0=34(x), r1=139(y), r2=16(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 139
LDI r2, 16
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
