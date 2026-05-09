; DESCRIPTION: Places a yellow 12x12 rectangle at position (94, 92).
; PLAN: r0=94(x), r1=92(y), r2=12(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 92
LDI r2, 12
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
