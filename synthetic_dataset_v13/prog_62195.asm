; DESCRIPTION: Places a yellow 48x73 rectangle at position (56, 65).
; PLAN: r0=56(x), r1=65(y), r2=48(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 65
LDI r2, 48
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
