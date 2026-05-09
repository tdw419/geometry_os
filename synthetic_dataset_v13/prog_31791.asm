; DESCRIPTION: Renders a magenta box of size 99x70 starting at (364, 16).
; PLAN: r0=364(x), r1=16(y), r2=99(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 16
LDI r2, 99
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
