; DESCRIPTION: Places a yellow 44x20 rectangle at position (359, 166).
; PLAN: r0=359(x), r1=166(y), r2=44(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 166
LDI r2, 44
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
