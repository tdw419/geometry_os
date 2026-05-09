; DESCRIPTION: Renders a white box of size 97x48 starting at (388, 13).
; PLAN: r0=388(x), r1=13(y), r2=97(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 13
LDI r2, 97
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
