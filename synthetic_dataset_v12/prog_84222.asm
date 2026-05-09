; DESCRIPTION: Places a white 13x44 rectangle at position (342, 31).
; PLAN: r0=342(x), r1=31(y), r2=13(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 31
LDI r2, 13
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
