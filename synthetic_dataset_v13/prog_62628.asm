; DESCRIPTION: Places a red 35x48 rectangle at position (316, 82).
; PLAN: r0=316(x), r1=82(y), r2=35(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 82
LDI r2, 35
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
