; DESCRIPTION: Places a red 78x87 rectangle at position (266, 94).
; PLAN: r0=266(x), r1=94(y), r2=78(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 94
LDI r2, 78
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
