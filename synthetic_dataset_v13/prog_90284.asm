; DESCRIPTION: Renders a green box of size 91x33 starting at (193, 116).
; PLAN: r0=193(x), r1=116(y), r2=91(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 116
LDI r2, 91
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
