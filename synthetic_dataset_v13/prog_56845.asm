; DESCRIPTION: Places a white 44x104 rectangle at position (292, 67).
; PLAN: r0=292(x), r1=67(y), r2=44(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 67
LDI r2, 44
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
