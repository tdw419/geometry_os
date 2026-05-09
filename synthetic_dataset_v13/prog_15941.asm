; DESCRIPTION: Places a white 21x102 rectangle at position (315, 31).
; PLAN: r0=315(x), r1=31(y), r2=21(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 31
LDI r2, 21
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
