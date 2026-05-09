; DESCRIPTION: Places a yellow 48x25 rectangle at position (400, 97).
; PLAN: r0=400(x), r1=97(y), r2=48(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 97
LDI r2, 48
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
