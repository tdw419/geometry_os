; DESCRIPTION: Places a red 17x99 rectangle at position (334, 66).
; PLAN: r0=334(x), r1=66(y), r2=17(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 66
LDI r2, 17
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
