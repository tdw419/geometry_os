; DESCRIPTION: Places a yellow 77x36 rectangle at position (102, 165).
; PLAN: r0=102(x), r1=165(y), r2=77(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 165
LDI r2, 77
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
