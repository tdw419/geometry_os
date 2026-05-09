; DESCRIPTION: Places a white 80x92 rectangle at position (31, 37).
; PLAN: r0=31(x), r1=37(y), r2=80(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 37
LDI r2, 80
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
