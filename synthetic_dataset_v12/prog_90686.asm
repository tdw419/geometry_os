; DESCRIPTION: Places a yellow 75x106 rectangle at position (71, 124).
; PLAN: r0=71(x), r1=124(y), r2=75(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 124
LDI r2, 75
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
