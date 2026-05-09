; DESCRIPTION: Places a white 17x34 rectangle at position (58, 95).
; PLAN: r0=58(x), r1=95(y), r2=17(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 95
LDI r2, 17
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
