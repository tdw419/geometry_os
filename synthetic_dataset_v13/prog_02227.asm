; DESCRIPTION: Renders a yellow box of size 41x10 starting at (228, 179).
; PLAN: r0=228(x), r1=179(y), r2=41(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 179
LDI r2, 41
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
