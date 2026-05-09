; DESCRIPTION: Places a red 58x63 rectangle at position (175, 99).
; PLAN: r0=175(x), r1=99(y), r2=58(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 99
LDI r2, 58
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
