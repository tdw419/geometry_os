; DESCRIPTION: Places a yellow 57x110 rectangle at position (73, 120).
; PLAN: r0=73(x), r1=120(y), r2=57(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 120
LDI r2, 57
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
