; DESCRIPTION: Places a cyan 104x52 rectangle at position (318, 18).
; PLAN: r0=318(x), r1=18(y), r2=104(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 18
LDI r2, 104
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
