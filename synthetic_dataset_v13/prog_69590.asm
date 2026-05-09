; DESCRIPTION: Places a cyan 112x106 rectangle at position (222, 102).
; PLAN: r0=222(x), r1=102(y), r2=112(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 102
LDI r2, 112
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
