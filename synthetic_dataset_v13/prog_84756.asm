; DESCRIPTION: Places a white 44x79 rectangle at position (218, 56).
; PLAN: r0=218(x), r1=56(y), r2=44(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 56
LDI r2, 44
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
