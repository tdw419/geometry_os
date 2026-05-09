; DESCRIPTION: Places a green 77x57 rectangle at position (419, 124).
; PLAN: r0=419(x), r1=124(y), r2=77(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 124
LDI r2, 77
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
