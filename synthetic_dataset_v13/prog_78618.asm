; DESCRIPTION: Places a cyan 115x36 rectangle at position (234, 4).
; PLAN: r0=234(x), r1=4(y), r2=115(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 4
LDI r2, 115
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
