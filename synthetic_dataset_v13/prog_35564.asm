; DESCRIPTION: Creates a green rectangular region at (277, 86) spanning 60 by 46 pixels.
; PLAN: r0=277(x), r1=86(y), r2=60(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 86
LDI r2, 60
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
