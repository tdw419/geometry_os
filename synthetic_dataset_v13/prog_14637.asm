; DESCRIPTION: Places a yellow 93x88 rectangle at position (77, 143).
; PLAN: r0=77(x), r1=143(y), r2=93(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 143
LDI r2, 93
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
