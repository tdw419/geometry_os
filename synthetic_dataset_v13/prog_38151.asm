; DESCRIPTION: Creates a green rectangular region at (213, 171) spanning 120 by 84 pixels.
; PLAN: r0=213(x), r1=171(y), r2=120(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 171
LDI r2, 120
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
