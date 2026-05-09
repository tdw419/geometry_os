; DESCRIPTION: Places a purple 91x99 rectangle at position (9, 143).
; PLAN: r0=9(x), r1=143(y), r2=91(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 143
LDI r2, 91
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
