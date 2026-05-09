; DESCRIPTION: Places a yellow 15x99 rectangle at position (135, 157).
; PLAN: r0=135(x), r1=157(y), r2=15(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 157
LDI r2, 15
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
