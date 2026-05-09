; DESCRIPTION: Places a cyan 104x109 rectangle at position (144, 36).
; PLAN: r0=144(x), r1=36(y), r2=104(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 36
LDI r2, 104
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
