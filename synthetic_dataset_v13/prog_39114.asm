; DESCRIPTION: Places a white 92x97 rectangle at position (355, 82).
; PLAN: r0=355(x), r1=82(y), r2=92(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 82
LDI r2, 92
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
