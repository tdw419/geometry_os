; DESCRIPTION: Creates a white rectangular region at (243, 160) spanning 22 by 11 pixels.
; PLAN: r0=243(x), r1=160(y), r2=22(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 160
LDI r2, 22
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
