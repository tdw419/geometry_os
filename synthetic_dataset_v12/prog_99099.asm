; DESCRIPTION: Renders a white box of size 44x74 starting at (329, 37).
; PLAN: r0=329(x), r1=37(y), r2=44(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 37
LDI r2, 44
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
