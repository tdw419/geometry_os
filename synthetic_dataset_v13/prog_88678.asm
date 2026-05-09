; DESCRIPTION: Places a yellow 75x70 rectangle at position (323, 107).
; PLAN: r0=323(x), r1=107(y), r2=75(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 107
LDI r2, 75
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
