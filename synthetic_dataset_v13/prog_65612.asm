; DESCRIPTION: Renders a purple box of size 48x30 starting at (290, 0).
; PLAN: r0=290(x), r1=0(y), r2=48(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 0
LDI r2, 48
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
