; DESCRIPTION: Places a yellow 38x99 rectangle at position (21, 51).
; PLAN: r0=21(x), r1=51(y), r2=38(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 51
LDI r2, 38
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
