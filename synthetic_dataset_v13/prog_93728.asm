; DESCRIPTION: Places a white 116x118 rectangle at position (277, 134).
; PLAN: r0=277(x), r1=134(y), r2=116(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 134
LDI r2, 116
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
