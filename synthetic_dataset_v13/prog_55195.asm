; DESCRIPTION: Places a yellow 91x49 rectangle at position (316, 150).
; PLAN: r0=316(x), r1=150(y), r2=91(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 150
LDI r2, 91
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
