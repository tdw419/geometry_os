; DESCRIPTION: Places a yellow 102x44 rectangle at position (349, 101).
; PLAN: r0=349(x), r1=101(y), r2=102(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 101
LDI r2, 102
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
