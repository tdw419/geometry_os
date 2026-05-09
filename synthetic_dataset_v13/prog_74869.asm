; DESCRIPTION: Renders a white box of size 60x47 starting at (252, 161).
; PLAN: r0=252(x), r1=161(y), r2=60(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 161
LDI r2, 60
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
