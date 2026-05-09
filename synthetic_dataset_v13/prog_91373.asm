; DESCRIPTION: Places a yellow 35x117 rectangle at position (75, 14).
; PLAN: r0=75(x), r1=14(y), r2=35(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 14
LDI r2, 35
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
