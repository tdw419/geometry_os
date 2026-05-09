; DESCRIPTION: Places a black 41x116 rectangle at position (391, 11).
; PLAN: r0=391(x), r1=11(y), r2=41(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 11
LDI r2, 41
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
