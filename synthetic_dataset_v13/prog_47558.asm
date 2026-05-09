; DESCRIPTION: Places a blue 83x77 rectangle at position (335, 175).
; PLAN: r0=335(x), r1=175(y), r2=83(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 175
LDI r2, 83
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
