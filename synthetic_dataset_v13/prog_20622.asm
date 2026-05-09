; DESCRIPTION: Places a white 11x57 rectangle at position (273, 48).
; PLAN: r0=273(x), r1=48(y), r2=11(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 48
LDI r2, 11
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
