; DESCRIPTION: Places a yellow 26x20 rectangle at position (486, 124).
; PLAN: r0=486(x), r1=124(y), r2=26(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 124
LDI r2, 26
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
