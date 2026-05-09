; DESCRIPTION: Places a white 97x82 rectangle at position (91, 90).
; PLAN: r0=91(x), r1=90(y), r2=97(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 90
LDI r2, 97
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
