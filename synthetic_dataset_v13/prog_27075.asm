; DESCRIPTION: Places a green 112x36 rectangle at position (117, 172).
; PLAN: r0=117(x), r1=172(y), r2=112(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 172
LDI r2, 112
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
