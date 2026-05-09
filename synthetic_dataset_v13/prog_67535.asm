; DESCRIPTION: Creates a green rectangular region at (277, 47) spanning 105 by 13 pixels.
; PLAN: r0=277(x), r1=47(y), r2=105(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 47
LDI r2, 105
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
