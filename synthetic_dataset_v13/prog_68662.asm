; DESCRIPTION: Places a black 23x96 rectangle at position (261, 55).
; PLAN: r0=261(x), r1=55(y), r2=23(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 55
LDI r2, 23
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
