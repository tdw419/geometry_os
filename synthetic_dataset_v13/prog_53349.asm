; DESCRIPTION: Creates a green rectangular region at (70, 25) spanning 113 by 37 pixels.
; PLAN: r0=70(x), r1=25(y), r2=113(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 25
LDI r2, 113
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
