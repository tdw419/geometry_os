; DESCRIPTION: Places a orange 117x94 rectangle at position (392, 118).
; PLAN: r0=392(x), r1=118(y), r2=117(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 118
LDI r2, 117
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
