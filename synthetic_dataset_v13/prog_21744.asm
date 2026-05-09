; DESCRIPTION: Places a black 104x16 rectangle at position (323, 0).
; PLAN: r0=323(x), r1=0(y), r2=104(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 0
LDI r2, 104
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
