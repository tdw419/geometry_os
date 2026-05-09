; DESCRIPTION: Places a green 118x102 rectangle at position (95, 34).
; PLAN: r0=95(x), r1=34(y), r2=118(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 34
LDI r2, 118
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
