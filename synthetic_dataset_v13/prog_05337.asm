; DESCRIPTION: Places a red 104x40 rectangle at position (94, 40).
; PLAN: r0=94(x), r1=40(y), r2=104(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 40
LDI r2, 104
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
