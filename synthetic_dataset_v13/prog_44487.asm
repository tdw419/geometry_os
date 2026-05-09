; DESCRIPTION: Places a yellow 30x83 rectangle at position (154, 140).
; PLAN: r0=154(x), r1=140(y), r2=30(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 140
LDI r2, 30
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
