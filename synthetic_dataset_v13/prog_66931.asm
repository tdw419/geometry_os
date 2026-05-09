; DESCRIPTION: Renders a green box of size 110x77 starting at (2, 143).
; PLAN: r0=2(x), r1=143(y), r2=110(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 143
LDI r2, 110
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
