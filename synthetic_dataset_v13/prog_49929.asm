; DESCRIPTION: Places a yellow 12x74 rectangle at position (35, 70).
; PLAN: r0=35(x), r1=70(y), r2=12(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 70
LDI r2, 12
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
