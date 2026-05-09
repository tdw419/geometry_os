; DESCRIPTION: Renders a green box of size 12x89 starting at (480, 18).
; PLAN: r0=480(x), r1=18(y), r2=12(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 18
LDI r2, 12
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
