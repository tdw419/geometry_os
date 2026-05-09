; DESCRIPTION: Places a yellow 48x41 rectangle at position (341, 106).
; PLAN: r0=341(x), r1=106(y), r2=48(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 106
LDI r2, 48
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
