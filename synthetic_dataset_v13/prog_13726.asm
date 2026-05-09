; DESCRIPTION: Places a yellow 35x57 rectangle at position (184, 0).
; PLAN: r0=184(x), r1=0(y), r2=35(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 0
LDI r2, 35
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
