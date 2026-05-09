; DESCRIPTION: Places a yellow 116x33 rectangle at position (46, 97).
; PLAN: r0=46(x), r1=97(y), r2=116(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 97
LDI r2, 116
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
