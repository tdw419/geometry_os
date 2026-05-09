; DESCRIPTION: Draws a white rectangle at (305, 47) with width 110 and height 97.
; PLAN: r0=305(x), r1=47(y), r2=110(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 47
LDI r2, 110
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
