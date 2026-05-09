; DESCRIPTION: Renders a cyan box of size 88x98 starting at (95, 4).
; PLAN: r0=95(x), r1=4(y), r2=88(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 4
LDI r2, 88
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
