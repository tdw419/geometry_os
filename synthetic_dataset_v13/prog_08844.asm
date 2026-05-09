; DESCRIPTION: Places a red 110x108 rectangle at position (263, 21).
; PLAN: r0=263(x), r1=21(y), r2=110(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 21
LDI r2, 110
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
