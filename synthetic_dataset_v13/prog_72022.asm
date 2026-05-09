; DESCRIPTION: Places a yellow 79x29 rectangle at position (353, 17).
; PLAN: r0=353(x), r1=17(y), r2=79(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 17
LDI r2, 79
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
