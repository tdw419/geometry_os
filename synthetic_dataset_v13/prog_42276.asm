; DESCRIPTION: Places a yellow 109x95 rectangle at position (316, 39).
; PLAN: r0=316(x), r1=39(y), r2=109(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 39
LDI r2, 109
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
