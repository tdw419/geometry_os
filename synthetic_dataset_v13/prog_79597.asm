; DESCRIPTION: Places a yellow 96x89 rectangle at position (103, 46).
; PLAN: r0=103(x), r1=46(y), r2=96(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 46
LDI r2, 96
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
