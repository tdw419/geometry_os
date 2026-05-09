; DESCRIPTION: Renders a white box of size 57x68 starting at (331, 135).
; PLAN: r0=331(x), r1=135(y), r2=57(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 135
LDI r2, 57
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
