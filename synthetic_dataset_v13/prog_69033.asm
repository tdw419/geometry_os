; DESCRIPTION: Renders a green box of size 104x13 starting at (335, 8).
; PLAN: r0=335(x), r1=8(y), r2=104(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 8
LDI r2, 104
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
