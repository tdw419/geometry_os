; DESCRIPTION: Creates a green rectangular region at (236, 39) spanning 14 by 120 pixels.
; PLAN: r0=236(x), r1=39(y), r2=14(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 39
LDI r2, 14
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
