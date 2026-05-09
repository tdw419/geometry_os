; DESCRIPTION: Renders a blue box of size 53x91 starting at (152, 57).
; PLAN: r0=152(x), r1=57(y), r2=53(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 57
LDI r2, 53
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
