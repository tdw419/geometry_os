; DESCRIPTION: Places a white 58x114 rectangle at position (400, 1).
; PLAN: r0=400(x), r1=1(y), r2=58(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 1
LDI r2, 58
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
