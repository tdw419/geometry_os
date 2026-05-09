; DESCRIPTION: Creates a green rectangular region at (317, 97) spanning 15 by 120 pixels.
; PLAN: r0=317(x), r1=97(y), r2=15(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 97
LDI r2, 15
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
