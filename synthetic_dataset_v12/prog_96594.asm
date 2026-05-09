; DESCRIPTION: Places a yellow 94x92 rectangle at position (69, 130).
; PLAN: r0=69(x), r1=130(y), r2=94(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 130
LDI r2, 94
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
