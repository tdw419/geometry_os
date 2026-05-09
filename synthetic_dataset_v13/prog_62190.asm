; DESCRIPTION: Places a red 115x55 rectangle at position (175, 160).
; PLAN: r0=175(x), r1=160(y), r2=115(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 160
LDI r2, 115
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
