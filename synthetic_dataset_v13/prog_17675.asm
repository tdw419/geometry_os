; DESCRIPTION: Renders a cyan box of size 58x41 starting at (437, 79).
; PLAN: r0=437(x), r1=79(y), r2=58(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 79
LDI r2, 58
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
