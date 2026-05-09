; DESCRIPTION: Places a red 104x97 rectangle at position (47, 7).
; PLAN: r0=47(x), r1=7(y), r2=104(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 7
LDI r2, 104
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
