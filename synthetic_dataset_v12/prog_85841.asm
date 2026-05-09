; DESCRIPTION: Places a red 94x78 rectangle at position (160, 37).
; PLAN: r0=160(x), r1=37(y), r2=94(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 37
LDI r2, 94
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
