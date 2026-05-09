; DESCRIPTION: Places a green 56x104 rectangle at position (15, 20).
; PLAN: r0=15(x), r1=20(y), r2=56(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 20
LDI r2, 56
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
