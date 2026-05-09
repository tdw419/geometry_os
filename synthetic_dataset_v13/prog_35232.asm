; DESCRIPTION: Places a red 97x61 rectangle at position (182, 104).
; PLAN: r0=182(x), r1=104(y), r2=97(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 104
LDI r2, 97
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
