; DESCRIPTION: Creates a green rectangular region at (393, 159) spanning 111 by 68 pixels.
; PLAN: r0=393(x), r1=159(y), r2=111(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 159
LDI r2, 111
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
