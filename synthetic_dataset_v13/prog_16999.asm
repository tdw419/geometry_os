; DESCRIPTION: Places a white 80x106 rectangle at position (336, 0).
; PLAN: r0=336(x), r1=0(y), r2=80(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 0
LDI r2, 80
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
