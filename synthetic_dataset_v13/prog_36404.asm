; DESCRIPTION: Places a yellow 98x112 rectangle at position (222, 34).
; PLAN: r0=222(x), r1=34(y), r2=98(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 34
LDI r2, 98
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
