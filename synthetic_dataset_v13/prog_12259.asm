; DESCRIPTION: Places a yellow 91x102 rectangle at position (141, 139).
; PLAN: r0=141(x), r1=139(y), r2=91(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 139
LDI r2, 91
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
