; DESCRIPTION: Places a yellow 112x92 rectangle at position (74, 86).
; PLAN: r0=74(x), r1=86(y), r2=112(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 86
LDI r2, 112
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
