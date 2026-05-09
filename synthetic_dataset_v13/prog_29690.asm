; DESCRIPTION: Renders a green box of size 104x48 starting at (92, 140).
; PLAN: r0=92(x), r1=140(y), r2=104(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 140
LDI r2, 104
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
