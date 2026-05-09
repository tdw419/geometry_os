; DESCRIPTION: Places a yellow 33x85 rectangle at position (160, 0).
; PLAN: r0=160(x), r1=0(y), r2=33(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 0
LDI r2, 33
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
