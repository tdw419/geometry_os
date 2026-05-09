; DESCRIPTION: Places a red 66x52 rectangle at position (4, 135).
; PLAN: r0=4(x), r1=135(y), r2=66(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 135
LDI r2, 66
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
