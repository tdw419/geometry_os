; DESCRIPTION: Places a red 18x97 rectangle at position (486, 83).
; PLAN: r0=486(x), r1=83(y), r2=18(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 83
LDI r2, 18
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
