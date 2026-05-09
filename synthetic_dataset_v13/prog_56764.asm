; DESCRIPTION: Renders a cyan box of size 104x114 starting at (202, 41).
; PLAN: r0=202(x), r1=41(y), r2=104(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 41
LDI r2, 104
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
