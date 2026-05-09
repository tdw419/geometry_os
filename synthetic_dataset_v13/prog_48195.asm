; DESCRIPTION: Places a green 77x11 rectangle at position (225, 34).
; PLAN: r0=225(x), r1=34(y), r2=77(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 34
LDI r2, 77
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
