; DESCRIPTION: Renders a yellow box of size 41x109 starting at (174, 61).
; PLAN: r0=174(x), r1=61(y), r2=41(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 61
LDI r2, 41
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
