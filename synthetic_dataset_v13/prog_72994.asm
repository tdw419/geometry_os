; DESCRIPTION: Places a cyan 116x33 rectangle at position (248, 9).
; PLAN: r0=248(x), r1=9(y), r2=116(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 9
LDI r2, 116
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
