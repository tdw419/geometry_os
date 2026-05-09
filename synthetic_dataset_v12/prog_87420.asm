; DESCRIPTION: Places a cyan 11x71 rectangle at position (99, 149).
; PLAN: r0=99(x), r1=149(y), r2=11(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 149
LDI r2, 11
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
