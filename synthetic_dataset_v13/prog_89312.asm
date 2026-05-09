; DESCRIPTION: Places a black 66x47 rectangle at position (422, 135).
; PLAN: r0=422(x), r1=135(y), r2=66(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 135
LDI r2, 66
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
