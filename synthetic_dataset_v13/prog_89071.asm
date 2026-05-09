; DESCRIPTION: Renders a green box of size 70x115 starting at (274, 45).
; PLAN: r0=274(x), r1=45(y), r2=70(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 45
LDI r2, 70
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
