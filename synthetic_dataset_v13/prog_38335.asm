; DESCRIPTION: Places a white 66x22 rectangle at position (423, 214).
; PLAN: r0=423(x), r1=214(y), r2=66(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 214
LDI r2, 66
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
