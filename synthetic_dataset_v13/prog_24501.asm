; DESCRIPTION: Places a red 34x94 rectangle at position (439, 9).
; PLAN: r0=439(x), r1=9(y), r2=34(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 9
LDI r2, 34
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
