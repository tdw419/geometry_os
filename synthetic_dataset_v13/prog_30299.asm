; DESCRIPTION: Places a white 72x80 rectangle at position (134, 49).
; PLAN: r0=134(x), r1=49(y), r2=72(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 49
LDI r2, 72
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
