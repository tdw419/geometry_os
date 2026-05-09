; DESCRIPTION: Renders a green box of size 76x48 starting at (277, 0).
; PLAN: r0=277(x), r1=0(y), r2=76(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 0
LDI r2, 76
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
