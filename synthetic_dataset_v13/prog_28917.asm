; DESCRIPTION: Places a white 33x34 rectangle at position (252, 10).
; PLAN: r0=252(x), r1=10(y), r2=33(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 10
LDI r2, 33
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
