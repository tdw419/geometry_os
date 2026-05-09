; DESCRIPTION: Places a yellow 89x59 rectangle at position (112, 46).
; PLAN: r0=112(x), r1=46(y), r2=89(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 46
LDI r2, 89
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
