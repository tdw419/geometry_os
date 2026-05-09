; DESCRIPTION: Places a green 14x104 rectangle at position (275, 149).
; PLAN: r0=275(x), r1=149(y), r2=14(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 149
LDI r2, 14
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
