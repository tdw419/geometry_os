; DESCRIPTION: Renders a cyan box of size 78x67 starting at (321, 41).
; PLAN: r0=321(x), r1=41(y), r2=78(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 41
LDI r2, 78
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
