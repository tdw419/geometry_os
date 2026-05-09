; DESCRIPTION: Renders a cyan box of size 41x107 starting at (468, 27).
; PLAN: r0=468(x), r1=27(y), r2=41(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 27
LDI r2, 41
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
