; DESCRIPTION: Places a green 65x36 rectangle at position (189, 77).
; PLAN: r0=189(x), r1=77(y), r2=65(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 77
LDI r2, 65
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
