; DESCRIPTION: Places a red 97x16 rectangle at position (133, 117).
; PLAN: r0=133(x), r1=117(y), r2=97(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 117
LDI r2, 97
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
