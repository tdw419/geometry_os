; DESCRIPTION: Places a black 91x41 rectangle at position (361, 20).
; PLAN: r0=361(x), r1=20(y), r2=91(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 20
LDI r2, 91
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
