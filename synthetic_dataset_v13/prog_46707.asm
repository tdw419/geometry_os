; DESCRIPTION: Draws a white rectangle at (393, 98) with width 109 and height 40.
; PLAN: r0=393(x), r1=98(y), r2=109(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 98
LDI r2, 109
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
