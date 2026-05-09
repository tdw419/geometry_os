; DESCRIPTION: Renders a white box of size 108x70 starting at (277, 63).
; PLAN: r0=277(x), r1=63(y), r2=108(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 63
LDI r2, 108
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
