; DESCRIPTION: Creates a green rectangular region at (102, 120) spanning 107 by 91 pixels.
; PLAN: r0=102(x), r1=120(y), r2=107(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 120
LDI r2, 107
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
