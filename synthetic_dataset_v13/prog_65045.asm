; DESCRIPTION: Places a yellow 89x80 rectangle at position (153, 19).
; PLAN: r0=153(x), r1=19(y), r2=89(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 19
LDI r2, 89
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
