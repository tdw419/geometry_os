; DESCRIPTION: Creates a green rectangular region at (54, 132) spanning 113 by 71 pixels.
; PLAN: r0=54(x), r1=132(y), r2=113(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 132
LDI r2, 113
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
