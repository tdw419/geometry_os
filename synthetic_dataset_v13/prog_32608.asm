; DESCRIPTION: Places a yellow 33x106 rectangle at position (4, 140).
; PLAN: r0=4(x), r1=140(y), r2=33(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 140
LDI r2, 33
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
