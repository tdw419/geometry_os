; DESCRIPTION: Places a yellow 90x99 rectangle at position (248, 56).
; PLAN: r0=248(x), r1=56(y), r2=90(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 56
LDI r2, 90
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
