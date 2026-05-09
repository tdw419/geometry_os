; DESCRIPTION: Places a red 56x75 rectangle at position (328, 78).
; PLAN: r0=328(x), r1=78(y), r2=56(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 78
LDI r2, 56
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
