; DESCRIPTION: Places a black 29x49 rectangle at position (116, 186).
; PLAN: r0=116(x), r1=186(y), r2=29(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 186
LDI r2, 29
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
