; DESCRIPTION: Places a white 58x12 rectangle at position (328, 100).
; PLAN: r0=328(x), r1=100(y), r2=58(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 100
LDI r2, 58
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
