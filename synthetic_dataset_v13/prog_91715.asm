; DESCRIPTION: Places a red 33x106 rectangle at position (124, 26).
; PLAN: r0=124(x), r1=26(y), r2=33(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 26
LDI r2, 33
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
