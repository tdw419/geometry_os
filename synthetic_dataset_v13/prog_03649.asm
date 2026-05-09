; DESCRIPTION: Renders a green box of size 80x76 starting at (373, 55).
; PLAN: r0=373(x), r1=55(y), r2=80(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 55
LDI r2, 80
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
