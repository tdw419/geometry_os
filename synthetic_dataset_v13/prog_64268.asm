; DESCRIPTION: Renders a green box of size 104x10 starting at (163, 200).
; PLAN: r0=163(x), r1=200(y), r2=104(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 200
LDI r2, 104
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
