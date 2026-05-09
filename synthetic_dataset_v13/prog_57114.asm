; DESCRIPTION: Places a cyan 104x73 rectangle at position (378, 24).
; PLAN: r0=378(x), r1=24(y), r2=104(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 24
LDI r2, 104
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
