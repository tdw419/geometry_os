; DESCRIPTION: Places a orange 52x61 rectangle at position (425, 58).
; PLAN: r0=425(x), r1=58(y), r2=52(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 58
LDI r2, 52
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
