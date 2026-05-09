; DESCRIPTION: Places a white 80x115 rectangle at position (58, 77).
; PLAN: r0=58(x), r1=77(y), r2=80(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 77
LDI r2, 80
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
