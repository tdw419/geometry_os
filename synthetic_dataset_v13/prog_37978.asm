; DESCRIPTION: Places a red 90x58 rectangle at position (141, 117).
; PLAN: r0=141(x), r1=117(y), r2=90(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 117
LDI r2, 90
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
