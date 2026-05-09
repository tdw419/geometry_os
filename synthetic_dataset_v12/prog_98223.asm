; DESCRIPTION: Places a white 66x82 rectangle at position (422, 170).
; PLAN: r0=422(x), r1=170(y), r2=66(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 170
LDI r2, 66
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
