; DESCRIPTION: Places a cyan 47x104 rectangle at position (225, 15).
; PLAN: r0=225(x), r1=15(y), r2=47(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 15
LDI r2, 47
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
