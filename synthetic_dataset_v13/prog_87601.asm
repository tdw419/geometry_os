; DESCRIPTION: Places a white 91x104 rectangle at position (259, 4).
; PLAN: r0=259(x), r1=4(y), r2=91(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 4
LDI r2, 91
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
