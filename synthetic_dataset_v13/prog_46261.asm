; DESCRIPTION: Places a white 11x80 rectangle at position (204, 156).
; PLAN: r0=204(x), r1=156(y), r2=11(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 156
LDI r2, 11
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
