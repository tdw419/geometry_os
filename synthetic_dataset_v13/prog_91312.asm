; DESCRIPTION: Places a black 50x58 rectangle at position (183, 186).
; PLAN: r0=183(x), r1=186(y), r2=50(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 186
LDI r2, 50
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
