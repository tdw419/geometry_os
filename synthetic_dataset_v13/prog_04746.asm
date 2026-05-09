; DESCRIPTION: Renders a cyan box of size 65x78 starting at (81, 62).
; PLAN: r0=81(x), r1=62(y), r2=65(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 62
LDI r2, 65
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
