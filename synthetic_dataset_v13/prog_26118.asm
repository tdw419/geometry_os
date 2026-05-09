; DESCRIPTION: Renders a cyan box of size 86x62 starting at (162, 43).
; PLAN: r0=162(x), r1=43(y), r2=86(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 43
LDI r2, 86
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
