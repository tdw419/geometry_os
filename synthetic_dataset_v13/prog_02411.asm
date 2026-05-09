; DESCRIPTION: Places a white 31x82 rectangle at position (94, 127).
; PLAN: r0=94(x), r1=127(y), r2=31(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 127
LDI r2, 31
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
