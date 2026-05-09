; DESCRIPTION: Places a white 29x60 rectangle at position (141, 118).
; PLAN: r0=141(x), r1=118(y), r2=29(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 118
LDI r2, 29
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
