; DESCRIPTION: Places a cyan 38x99 rectangle at position (44, 145).
; PLAN: r0=44(x), r1=145(y), r2=38(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 145
LDI r2, 38
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
