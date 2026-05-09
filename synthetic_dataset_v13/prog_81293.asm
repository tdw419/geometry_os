; DESCRIPTION: Places a yellow 60x102 rectangle at position (341, 85).
; PLAN: r0=341(x), r1=85(y), r2=60(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 85
LDI r2, 60
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
