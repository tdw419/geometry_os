; DESCRIPTION: Places a yellow 86x65 rectangle at position (316, 159).
; PLAN: r0=316(x), r1=159(y), r2=86(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 159
LDI r2, 86
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
