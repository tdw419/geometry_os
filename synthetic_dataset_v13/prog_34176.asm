; DESCRIPTION: Places a white 52x97 rectangle at position (147, 20).
; PLAN: r0=147(x), r1=20(y), r2=52(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 20
LDI r2, 52
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
