; DESCRIPTION: Creates a green rectangular region at (202, 71) spanning 33 by 113 pixels.
; PLAN: r0=202(x), r1=71(y), r2=33(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 71
LDI r2, 33
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
