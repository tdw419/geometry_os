; DESCRIPTION: Places a black 78x47 rectangle at position (66, 33).
; PLAN: r0=66(x), r1=33(y), r2=78(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 33
LDI r2, 78
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
