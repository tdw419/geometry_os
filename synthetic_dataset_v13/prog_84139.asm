; DESCRIPTION: Places a white 77x37 rectangle at position (352, 44).
; PLAN: r0=352(x), r1=44(y), r2=77(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 44
LDI r2, 77
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
