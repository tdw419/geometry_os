; DESCRIPTION: Places a red 11x61 rectangle at position (70, 144).
; PLAN: r0=70(x), r1=144(y), r2=11(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 144
LDI r2, 11
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
