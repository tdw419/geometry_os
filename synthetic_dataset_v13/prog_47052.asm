; DESCRIPTION: Renders a green box of size 112x104 starting at (300, 32).
; PLAN: r0=300(x), r1=32(y), r2=112(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 32
LDI r2, 112
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
