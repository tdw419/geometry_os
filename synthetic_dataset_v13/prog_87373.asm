; DESCRIPTION: Places a yellow 45x66 rectangle at position (135, 0).
; PLAN: r0=135(x), r1=0(y), r2=45(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 0
LDI r2, 45
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
