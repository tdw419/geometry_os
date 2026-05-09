; DESCRIPTION: Places a green 83x77 rectangle at position (363, 94).
; PLAN: r0=363(x), r1=94(y), r2=83(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 94
LDI r2, 83
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
