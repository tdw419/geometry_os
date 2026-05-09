; DESCRIPTION: Renders a green box of size 68x23 starting at (48, 189).
; PLAN: r0=48(x), r1=189(y), r2=68(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 189
LDI r2, 68
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
