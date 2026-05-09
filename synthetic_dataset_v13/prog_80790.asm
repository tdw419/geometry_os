; DESCRIPTION: Creates a blue rectangular region at (156, 132) spanning 77 by 50 pixels.
; PLAN: r0=156(x), r1=132(y), r2=77(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 132
LDI r2, 77
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
