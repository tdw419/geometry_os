; DESCRIPTION: Renders a green box of size 32x32 starting at (80, 216).
; PLAN: r0=80(x), r1=216(y), r2=32(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 216
LDI r2, 32
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
