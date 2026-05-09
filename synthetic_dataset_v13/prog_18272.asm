; DESCRIPTION: Places a red 37x92 rectangle at position (55, 86).
; PLAN: r0=55(x), r1=86(y), r2=37(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 86
LDI r2, 37
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
