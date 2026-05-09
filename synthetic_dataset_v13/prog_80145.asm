; DESCRIPTION: Places a white 29x104 rectangle at position (94, 91).
; PLAN: r0=94(x), r1=91(y), r2=29(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 91
LDI r2, 29
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
