; DESCRIPTION: Places a white 37x33 rectangle at position (29, 21).
; PLAN: r0=29(x), r1=21(y), r2=37(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 21
LDI r2, 37
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
