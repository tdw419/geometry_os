; DESCRIPTION: Renders a cyan box of size 94x88 starting at (55, 18).
; PLAN: r0=55(x), r1=18(y), r2=94(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 18
LDI r2, 94
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
