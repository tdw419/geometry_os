; DESCRIPTION: Places a white 85x94 rectangle at position (264, 56).
; PLAN: r0=264(x), r1=56(y), r2=85(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 56
LDI r2, 85
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
