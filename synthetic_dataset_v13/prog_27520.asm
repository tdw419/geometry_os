; DESCRIPTION: Places a white 80x98 rectangle at position (249, 137).
; PLAN: r0=249(x), r1=137(y), r2=80(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 137
LDI r2, 80
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
