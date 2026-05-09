; DESCRIPTION: Renders a cyan box of size 41x106 starting at (254, 70).
; PLAN: r0=254(x), r1=70(y), r2=41(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 70
LDI r2, 41
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
