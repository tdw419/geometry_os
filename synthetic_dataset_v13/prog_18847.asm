; DESCRIPTION: Places a yellow 99x120 rectangle at position (155, 107).
; PLAN: r0=155(x), r1=107(y), r2=99(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 107
LDI r2, 99
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
