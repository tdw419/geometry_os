; DESCRIPTION: Places a white 33x87 rectangle at position (373, 37).
; PLAN: r0=373(x), r1=37(y), r2=33(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 37
LDI r2, 33
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
