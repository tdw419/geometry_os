; DESCRIPTION: Renders a cyan box of size 41x78 starting at (303, 63).
; PLAN: r0=303(x), r1=63(y), r2=41(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 63
LDI r2, 41
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
