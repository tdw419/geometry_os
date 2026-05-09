; DESCRIPTION: Creates a blue rectangular region at (242, 91) spanning 87 by 113 pixels.
; PLAN: r0=242(x), r1=91(y), r2=87(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 91
LDI r2, 87
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
