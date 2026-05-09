; DESCRIPTION: Renders a white box of size 104x115 starting at (226, 118).
; PLAN: r0=226(x), r1=118(y), r2=104(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 118
LDI r2, 104
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
