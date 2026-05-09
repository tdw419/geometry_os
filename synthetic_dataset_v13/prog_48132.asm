; DESCRIPTION: Places a red 116x12 rectangle at position (223, 221).
; PLAN: r0=223(x), r1=221(y), r2=116(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 221
LDI r2, 116
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
