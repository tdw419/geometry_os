; DESCRIPTION: Renders a cyan box of size 88x62 starting at (118, 193).
; PLAN: r0=118(x), r1=193(y), r2=88(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 193
LDI r2, 88
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
