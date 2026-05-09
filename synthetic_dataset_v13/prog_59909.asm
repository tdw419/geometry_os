; DESCRIPTION: Places a red 37x37 rectangle at position (313, 17).
; PLAN: r0=313(x), r1=17(y), r2=37(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 17
LDI r2, 37
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
