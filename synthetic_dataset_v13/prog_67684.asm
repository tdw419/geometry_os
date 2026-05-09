; DESCRIPTION: Places a yellow 57x76 rectangle at position (321, 75).
; PLAN: r0=321(x), r1=75(y), r2=57(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 75
LDI r2, 57
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
