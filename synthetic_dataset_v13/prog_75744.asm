; DESCRIPTION: Creates a green rectangular region at (116, 132) spanning 54 by 120 pixels.
; PLAN: r0=116(x), r1=132(y), r2=54(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 132
LDI r2, 54
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
