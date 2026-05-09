; DESCRIPTION: Places a red 54x57 rectangle at position (248, 9).
; PLAN: r0=248(x), r1=9(y), r2=54(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 9
LDI r2, 54
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
