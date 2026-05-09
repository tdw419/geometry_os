; DESCRIPTION: Places a cyan 110x99 rectangle at position (208, 63).
; PLAN: r0=208(x), r1=63(y), r2=110(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 63
LDI r2, 110
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
