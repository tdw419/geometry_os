; DESCRIPTION: Renders a cyan box of size 41x23 starting at (188, 25).
; PLAN: r0=188(x), r1=25(y), r2=41(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 25
LDI r2, 41
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
