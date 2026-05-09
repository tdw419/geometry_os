; DESCRIPTION: Places a black 20x25 rectangle at position (316, 48).
; PLAN: r0=316(x), r1=48(y), r2=20(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 48
LDI r2, 20
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
