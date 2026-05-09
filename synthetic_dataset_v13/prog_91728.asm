; DESCRIPTION: Places a yellow 94x95 rectangle at position (47, 130).
; PLAN: r0=47(x), r1=130(y), r2=94(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 130
LDI r2, 94
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
