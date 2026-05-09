; DESCRIPTION: Renders a cyan box of size 91x43 starting at (254, 78).
; PLAN: r0=254(x), r1=78(y), r2=91(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 78
LDI r2, 91
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
