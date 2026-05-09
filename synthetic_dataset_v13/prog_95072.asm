; DESCRIPTION: Places a red 56x81 rectangle at position (332, 92).
; PLAN: r0=332(x), r1=92(y), r2=56(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 92
LDI r2, 56
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
