; DESCRIPTION: Places a yellow 31x20 rectangle at position (420, 34).
; PLAN: r0=420(x), r1=34(y), r2=31(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 34
LDI r2, 31
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
