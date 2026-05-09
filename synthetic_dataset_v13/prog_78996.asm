; DESCRIPTION: Places a white 10x113 rectangle at position (147, 9).
; PLAN: r0=147(x), r1=9(y), r2=10(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 9
LDI r2, 10
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
