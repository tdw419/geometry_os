; DESCRIPTION: Places a cyan 22x73 rectangle at position (17, 87).
; PLAN: r0=17(x), r1=87(y), r2=22(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 87
LDI r2, 22
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
