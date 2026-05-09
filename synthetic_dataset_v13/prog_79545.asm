; DESCRIPTION: Renders a cyan box of size 41x90 starting at (80, 41).
; PLAN: r0=80(x), r1=41(y), r2=41(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 41
LDI r2, 41
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
