; DESCRIPTION: Places a cyan 67x104 rectangle at position (269, 147).
; PLAN: r0=269(x), r1=147(y), r2=67(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 147
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
