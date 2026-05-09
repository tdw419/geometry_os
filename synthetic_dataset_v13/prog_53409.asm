; DESCRIPTION: Places a cyan 78x91 rectangle at position (223, 157).
; PLAN: r0=223(x), r1=157(y), r2=78(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 157
LDI r2, 78
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
