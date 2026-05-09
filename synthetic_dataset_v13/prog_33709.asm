; DESCRIPTION: Renders a white box of size 79x62 starting at (393, 70).
; PLAN: r0=393(x), r1=70(y), r2=79(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 70
LDI r2, 79
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
