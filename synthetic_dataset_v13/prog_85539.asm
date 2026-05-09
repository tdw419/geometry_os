; DESCRIPTION: Places a yellow 20x77 rectangle at position (321, 85).
; PLAN: r0=321(x), r1=85(y), r2=20(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 85
LDI r2, 20
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
