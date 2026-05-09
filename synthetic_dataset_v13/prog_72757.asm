; DESCRIPTION: Creates a green rectangular region at (174, 146) spanning 91 by 87 pixels.
; PLAN: r0=174(x), r1=146(y), r2=91(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 146
LDI r2, 91
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
