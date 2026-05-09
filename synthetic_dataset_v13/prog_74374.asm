; DESCRIPTION: Places a white 83x41 rectangle at position (183, 182).
; PLAN: r0=183(x), r1=182(y), r2=83(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 182
LDI r2, 83
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
