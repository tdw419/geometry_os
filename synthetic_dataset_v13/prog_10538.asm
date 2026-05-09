; DESCRIPTION: Creates a green rectangular region at (387, 48) spanning 105 by 47 pixels.
; PLAN: r0=387(x), r1=48(y), r2=105(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 48
LDI r2, 105
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
