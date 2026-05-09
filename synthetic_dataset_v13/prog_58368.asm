; DESCRIPTION: Places a yellow 57x73 rectangle at position (5, 40).
; PLAN: r0=5(x), r1=40(y), r2=57(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 40
LDI r2, 57
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
