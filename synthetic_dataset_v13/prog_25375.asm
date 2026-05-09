; DESCRIPTION: Draws a white rectangle at (307, 47) with width 66 and height 31.
; PLAN: r0=307(x), r1=47(y), r2=66(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 47
LDI r2, 66
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
