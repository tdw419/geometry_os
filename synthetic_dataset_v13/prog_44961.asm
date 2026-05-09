; DESCRIPTION: Renders a blue box of size 83x91 starting at (392, 85).
; PLAN: r0=392(x), r1=85(y), r2=83(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 85
LDI r2, 83
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
