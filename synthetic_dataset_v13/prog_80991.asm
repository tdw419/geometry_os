; DESCRIPTION: Places a white 10x80 rectangle at position (409, 104).
; PLAN: r0=409(x), r1=104(y), r2=10(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 104
LDI r2, 10
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
