; DESCRIPTION: Places a cyan 33x49 rectangle at position (234, 86).
; PLAN: r0=234(x), r1=86(y), r2=33(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 86
LDI r2, 33
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
