; DESCRIPTION: Draws a white rectangle at (168, 152) with width 31 and height 60.
; PLAN: r0=168(x), r1=152(y), r2=31(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 152
LDI r2, 31
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
