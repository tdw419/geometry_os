; DESCRIPTION: Renders a cyan box of size 88x37 starting at (22, 150).
; PLAN: r0=22(x), r1=150(y), r2=88(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 150
LDI r2, 88
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
