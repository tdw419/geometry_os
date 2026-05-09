; DESCRIPTION: Places a yellow 22x73 rectangle at position (112, 92).
; PLAN: r0=112(x), r1=92(y), r2=22(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 92
LDI r2, 22
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
