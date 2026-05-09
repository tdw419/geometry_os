; DESCRIPTION: Places a white 78x38 rectangle at position (399, 34).
; PLAN: r0=399(x), r1=34(y), r2=78(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 34
LDI r2, 78
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
