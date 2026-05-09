; DESCRIPTION: Places a yellow 96x92 rectangle at position (181, 124).
; PLAN: r0=181(x), r1=124(y), r2=96(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 124
LDI r2, 96
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
