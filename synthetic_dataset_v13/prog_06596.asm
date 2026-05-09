; DESCRIPTION: Places a yellow 45x60 rectangle at position (264, 94).
; PLAN: r0=264(x), r1=94(y), r2=45(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 94
LDI r2, 45
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
