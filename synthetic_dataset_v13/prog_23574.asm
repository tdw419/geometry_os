; DESCRIPTION: Places a cyan 45x105 rectangle at position (338, 23).
; PLAN: r0=338(x), r1=23(y), r2=45(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 23
LDI r2, 45
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
