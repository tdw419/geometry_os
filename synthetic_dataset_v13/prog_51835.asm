; DESCRIPTION: Places a red 91x34 rectangle at position (31, 86).
; PLAN: r0=31(x), r1=86(y), r2=91(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 86
LDI r2, 91
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
