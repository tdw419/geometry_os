; DESCRIPTION: Places a red 14x34 rectangle at position (342, 188).
; PLAN: r0=342(x), r1=188(y), r2=14(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 188
LDI r2, 14
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
