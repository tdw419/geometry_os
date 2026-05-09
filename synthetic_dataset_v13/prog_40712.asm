; DESCRIPTION: Places a yellow 29x90 rectangle at position (456, 78).
; PLAN: r0=456(x), r1=78(y), r2=29(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 78
LDI r2, 29
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
