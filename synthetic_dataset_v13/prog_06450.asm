; DESCRIPTION: Renders a white box of size 117x58 starting at (186, 158).
; PLAN: r0=186(x), r1=158(y), r2=117(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 158
LDI r2, 117
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
