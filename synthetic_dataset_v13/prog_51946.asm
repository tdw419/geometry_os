; DESCRIPTION: Places a white 14x78 rectangle at position (355, 34).
; PLAN: r0=355(x), r1=34(y), r2=14(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 34
LDI r2, 14
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
