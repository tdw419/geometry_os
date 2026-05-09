; DESCRIPTION: Renders a cyan box of size 65x107 starting at (41, 49).
; PLAN: r0=41(x), r1=49(y), r2=65(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 49
LDI r2, 65
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
