; DESCRIPTION: Places a red 85x104 rectangle at position (141, 96).
; PLAN: r0=141(x), r1=96(y), r2=85(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 96
LDI r2, 85
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
