; DESCRIPTION: Places a orange 116x49 rectangle at position (264, 170).
; PLAN: r0=264(x), r1=170(y), r2=116(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 170
LDI r2, 116
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
