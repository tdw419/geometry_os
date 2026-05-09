; DESCRIPTION: Places a red 77x17 rectangle at position (321, 102).
; PLAN: r0=321(x), r1=102(y), r2=77(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 102
LDI r2, 77
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
