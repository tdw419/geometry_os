; DESCRIPTION: Renders a green box of size 32x80 starting at (152, 69).
; PLAN: r0=152(x), r1=69(y), r2=32(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 69
LDI r2, 32
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
