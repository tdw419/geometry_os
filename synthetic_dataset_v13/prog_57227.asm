; DESCRIPTION: Places a red 65x97 rectangle at position (361, 58).
; PLAN: r0=361(x), r1=58(y), r2=65(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 58
LDI r2, 65
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
