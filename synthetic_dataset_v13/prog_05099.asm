; DESCRIPTION: Places a white 82x10 rectangle at position (229, 104).
; PLAN: r0=229(x), r1=104(y), r2=82(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 104
LDI r2, 82
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
