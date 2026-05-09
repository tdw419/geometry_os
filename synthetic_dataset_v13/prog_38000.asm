; DESCRIPTION: Creates a orange rectangular region at (208, 106) spanning 17 by 80 pixels.
; PLAN: r0=208(x), r1=106(y), r2=17(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 106
LDI r2, 17
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
