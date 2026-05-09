; DESCRIPTION: Renders a cyan box of size 82x100 starting at (174, 41).
; PLAN: r0=174(x), r1=41(y), r2=82(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 41
LDI r2, 82
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
