; DESCRIPTION: Places a white 13x112 rectangle at position (387, 72).
; PLAN: r0=387(x), r1=72(y), r2=13(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 72
LDI r2, 13
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
