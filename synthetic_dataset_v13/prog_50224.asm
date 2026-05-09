; DESCRIPTION: Places a red 118x79 rectangle at position (368, 30).
; PLAN: r0=368(x), r1=30(y), r2=118(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 30
LDI r2, 118
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
