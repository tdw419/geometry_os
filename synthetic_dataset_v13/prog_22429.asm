; DESCRIPTION: Renders a green box of size 53x47 starting at (453, 107).
; PLAN: r0=453(x), r1=107(y), r2=53(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 107
LDI r2, 53
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
