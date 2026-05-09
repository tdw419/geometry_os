; DESCRIPTION: Places a yellow 78x23 rectangle at position (225, 149).
; PLAN: r0=225(x), r1=149(y), r2=78(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 149
LDI r2, 78
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
