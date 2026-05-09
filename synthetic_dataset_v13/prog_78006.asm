; DESCRIPTION: Places a red 10x82 rectangle at position (328, 58).
; PLAN: r0=328(x), r1=58(y), r2=10(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 58
LDI r2, 10
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
