; DESCRIPTION: Places a white 17x92 rectangle at position (112, 115).
; PLAN: r0=112(x), r1=115(y), r2=17(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 115
LDI r2, 17
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
