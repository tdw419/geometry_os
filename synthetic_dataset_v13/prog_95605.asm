; DESCRIPTION: Places a yellow 118x47 rectangle at position (339, 177).
; PLAN: r0=339(x), r1=177(y), r2=118(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 177
LDI r2, 118
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
