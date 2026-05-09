; DESCRIPTION: Renders a green box of size 109x32 starting at (124, 20).
; PLAN: r0=124(x), r1=20(y), r2=109(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 20
LDI r2, 109
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
