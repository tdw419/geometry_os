; DESCRIPTION: Places a yellow 63x19 rectangle at position (119, 209).
; PLAN: r0=119(x), r1=209(y), r2=63(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 209
LDI r2, 63
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
