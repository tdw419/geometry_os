; DESCRIPTION: Creates a green rectangular region at (46, 146) spanning 26 by 39 pixels.
; PLAN: r0=46(x), r1=146(y), r2=26(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 146
LDI r2, 26
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
