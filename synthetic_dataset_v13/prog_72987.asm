; DESCRIPTION: Places a white 115x83 rectangle at position (34, 68).
; PLAN: r0=34(x), r1=68(y), r2=115(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 68
LDI r2, 115
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
