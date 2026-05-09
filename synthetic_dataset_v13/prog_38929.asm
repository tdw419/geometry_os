; DESCRIPTION: Places a red 55x31 rectangle at position (114, 179).
; PLAN: r0=114(x), r1=179(y), r2=55(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 179
LDI r2, 55
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
