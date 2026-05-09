; DESCRIPTION: Places a cyan 19x13 rectangle at position (312, 55).
; PLAN: r0=312(x), r1=55(y), r2=19(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 55
LDI r2, 19
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
