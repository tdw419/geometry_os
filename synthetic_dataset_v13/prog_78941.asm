; DESCRIPTION: Places a yellow 15x99 rectangle at position (57, 129).
; PLAN: r0=57(x), r1=129(y), r2=15(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 129
LDI r2, 15
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
