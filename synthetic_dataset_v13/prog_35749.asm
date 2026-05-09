; DESCRIPTION: Renders a green box of size 53x48 starting at (160, 115).
; PLAN: r0=160(x), r1=115(y), r2=53(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 115
LDI r2, 53
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
