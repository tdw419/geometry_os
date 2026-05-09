; DESCRIPTION: Places a white 65x54 rectangle at position (249, 118).
; PLAN: r0=249(x), r1=118(y), r2=65(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 118
LDI r2, 65
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
