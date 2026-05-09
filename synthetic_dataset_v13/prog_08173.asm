; DESCRIPTION: Places a cyan 28x49 rectangle at position (316, 94).
; PLAN: r0=316(x), r1=94(y), r2=28(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 94
LDI r2, 28
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
