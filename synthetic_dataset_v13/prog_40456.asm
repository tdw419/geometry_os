; DESCRIPTION: Creates a blue rectangular region at (242, 153) spanning 91 by 50 pixels.
; PLAN: r0=242(x), r1=153(y), r2=91(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 153
LDI r2, 91
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
