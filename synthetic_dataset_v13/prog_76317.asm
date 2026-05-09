; DESCRIPTION: Places a yellow 54x37 rectangle at position (124, 177).
; PLAN: r0=124(x), r1=177(y), r2=54(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 177
LDI r2, 54
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
