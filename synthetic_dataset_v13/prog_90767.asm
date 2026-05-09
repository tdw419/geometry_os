; DESCRIPTION: Places a yellow 110x28 rectangle at position (383, 86).
; PLAN: r0=383(x), r1=86(y), r2=110(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 86
LDI r2, 110
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
