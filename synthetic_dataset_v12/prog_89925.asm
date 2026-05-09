; DESCRIPTION: Places a white 104x80 rectangle at position (266, 141).
; PLAN: r0=266(x), r1=141(y), r2=104(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 141
LDI r2, 104
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
