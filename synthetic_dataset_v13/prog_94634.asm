; DESCRIPTION: Places a white 21x98 rectangle at position (211, 114).
; PLAN: r0=211(x), r1=114(y), r2=21(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 114
LDI r2, 21
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
