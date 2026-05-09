; DESCRIPTION: Places a green 57x17 rectangle at position (249, 96).
; PLAN: r0=249(x), r1=96(y), r2=57(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 96
LDI r2, 57
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
