; DESCRIPTION: Renders a white box of size 65x75 starting at (273, 180).
; PLAN: r0=273(x), r1=180(y), r2=65(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 180
LDI r2, 65
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
