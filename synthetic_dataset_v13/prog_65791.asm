; DESCRIPTION: Places a white 44x52 rectangle at position (336, 189).
; PLAN: r0=336(x), r1=189(y), r2=44(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 189
LDI r2, 44
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
