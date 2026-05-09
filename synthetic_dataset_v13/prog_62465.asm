; DESCRIPTION: Places a white 104x66 rectangle at position (24, 50).
; PLAN: r0=24(x), r1=50(y), r2=104(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 50
LDI r2, 104
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
