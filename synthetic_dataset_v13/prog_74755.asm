; DESCRIPTION: Renders a cyan box of size 41x65 starting at (338, 98).
; PLAN: r0=338(x), r1=98(y), r2=41(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 98
LDI r2, 41
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
