; DESCRIPTION: Places a yellow 55x75 rectangle at position (188, 26).
; PLAN: r0=188(x), r1=26(y), r2=55(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 26
LDI r2, 55
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
