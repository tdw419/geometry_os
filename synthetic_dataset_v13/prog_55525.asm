; DESCRIPTION: Places a red 26x53 rectangle at position (361, 144).
; PLAN: r0=361(x), r1=144(y), r2=26(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 144
LDI r2, 26
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
