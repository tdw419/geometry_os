; DESCRIPTION: Places a cyan 11x33 rectangle at position (423, 79).
; PLAN: r0=423(x), r1=79(y), r2=11(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 79
LDI r2, 11
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
