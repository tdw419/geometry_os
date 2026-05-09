; DESCRIPTION: Places a green 89x82 rectangle at position (72, 124).
; PLAN: r0=72(x), r1=124(y), r2=89(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 124
LDI r2, 89
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
