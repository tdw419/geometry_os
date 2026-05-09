; DESCRIPTION: Renders a magenta box of size 83x55 starting at (110, 91).
; PLAN: r0=110(x), r1=91(y), r2=83(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 91
LDI r2, 83
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
