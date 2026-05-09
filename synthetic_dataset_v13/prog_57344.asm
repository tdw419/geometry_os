; DESCRIPTION: Places a orange 118x115 rectangle at position (197, 4).
; PLAN: r0=197(x), r1=4(y), r2=118(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 4
LDI r2, 118
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
