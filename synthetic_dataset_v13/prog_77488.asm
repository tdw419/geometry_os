; DESCRIPTION: Places a yellow 94x77 rectangle at position (205, 116).
; PLAN: r0=205(x), r1=116(y), r2=94(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 116
LDI r2, 94
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
