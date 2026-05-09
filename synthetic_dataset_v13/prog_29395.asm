; DESCRIPTION: Places a white 54x15 rectangle at position (148, 31).
; PLAN: r0=148(x), r1=31(y), r2=54(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 31
LDI r2, 54
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
