; DESCRIPTION: Places a yellow 106x23 rectangle at position (400, 188).
; PLAN: r0=400(x), r1=188(y), r2=106(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 188
LDI r2, 106
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
