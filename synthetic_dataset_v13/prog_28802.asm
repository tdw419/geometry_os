; DESCRIPTION: Renders a green box of size 36x41 starting at (204, 190).
; PLAN: r0=204(x), r1=190(y), r2=36(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 190
LDI r2, 36
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
