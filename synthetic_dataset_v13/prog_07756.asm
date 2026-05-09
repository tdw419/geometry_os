; DESCRIPTION: Places a white 102x103 rectangle at position (388, 104).
; PLAN: r0=388(x), r1=104(y), r2=102(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 104
LDI r2, 102
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
