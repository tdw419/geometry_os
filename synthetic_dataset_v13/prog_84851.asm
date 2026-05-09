; DESCRIPTION: Places a green 11x33 rectangle at position (354, 52).
; PLAN: r0=354(x), r1=52(y), r2=11(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 52
LDI r2, 11
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
