; DESCRIPTION: Renders a green box of size 15x55 starting at (297, 193).
; PLAN: r0=297(x), r1=193(y), r2=15(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 193
LDI r2, 15
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
