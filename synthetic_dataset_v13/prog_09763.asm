; DESCRIPTION: Places a yellow 96x70 rectangle at position (233, 44).
; PLAN: r0=233(x), r1=44(y), r2=96(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 44
LDI r2, 96
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
