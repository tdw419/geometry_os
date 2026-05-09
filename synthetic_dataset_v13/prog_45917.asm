; DESCRIPTION: Renders a cyan box of size 41x38 starting at (461, 175).
; PLAN: r0=461(x), r1=175(y), r2=41(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 175
LDI r2, 41
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
