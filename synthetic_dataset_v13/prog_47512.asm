; DESCRIPTION: Creates a green rectangular region at (276, 27) spanning 58 by 58 pixels.
; PLAN: r0=276(x), r1=27(y), r2=58(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 27
LDI r2, 58
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
