; DESCRIPTION: Places a white 35x56 rectangle at position (325, 92).
; PLAN: r0=325(x), r1=92(y), r2=35(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 92
LDI r2, 35
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
