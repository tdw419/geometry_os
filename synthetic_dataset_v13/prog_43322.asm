; DESCRIPTION: Creates a green rectangular region at (276, 69) spanning 54 by 98 pixels.
; PLAN: r0=276(x), r1=69(y), r2=54(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 69
LDI r2, 54
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
