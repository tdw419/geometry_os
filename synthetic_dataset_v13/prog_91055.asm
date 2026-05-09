; DESCRIPTION: Places a cyan 54x116 rectangle at position (312, 126).
; PLAN: r0=312(x), r1=126(y), r2=54(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 126
LDI r2, 54
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
