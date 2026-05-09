; DESCRIPTION: Places a red 57x94 rectangle at position (288, 96).
; PLAN: r0=288(x), r1=96(y), r2=57(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 96
LDI r2, 57
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
