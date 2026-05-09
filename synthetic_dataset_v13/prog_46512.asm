; DESCRIPTION: Creates a magenta rectangular region at (242, 132) spanning 65 by 13 pixels.
; PLAN: r0=242(x), r1=132(y), r2=65(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 132
LDI r2, 65
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
