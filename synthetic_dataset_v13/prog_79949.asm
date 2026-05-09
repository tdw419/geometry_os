; DESCRIPTION: Places a red 89x86 rectangle at position (104, 31).
; PLAN: r0=104(x), r1=31(y), r2=89(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 31
LDI r2, 89
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
