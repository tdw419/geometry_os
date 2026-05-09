; DESCRIPTION: Creates a green rectangular region at (277, 84) spanning 113 by 11 pixels.
; PLAN: r0=277(x), r1=84(y), r2=113(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 84
LDI r2, 113
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
