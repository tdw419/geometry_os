; DESCRIPTION: Renders a white box of size 115x26 starting at (261, 152).
; PLAN: r0=261(x), r1=152(y), r2=115(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 152
LDI r2, 115
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
