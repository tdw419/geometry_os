; DESCRIPTION: Places a white 115x34 rectangle at position (363, 124).
; PLAN: r0=363(x), r1=124(y), r2=115(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 124
LDI r2, 115
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
