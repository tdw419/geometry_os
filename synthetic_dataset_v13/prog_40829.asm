; DESCRIPTION: Places a yellow 44x112 rectangle at position (25, 46).
; PLAN: r0=25(x), r1=46(y), r2=44(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 46
LDI r2, 44
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
