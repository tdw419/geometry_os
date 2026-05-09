; DESCRIPTION: Places a white 78x89 rectangle at position (410, 58).
; PLAN: r0=410(x), r1=58(y), r2=78(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 58
LDI r2, 78
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
