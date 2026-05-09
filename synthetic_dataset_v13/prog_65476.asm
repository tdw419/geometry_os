; DESCRIPTION: Places a white 71x66 rectangle at position (176, 15).
; PLAN: r0=176(x), r1=15(y), r2=71(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 15
LDI r2, 71
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
