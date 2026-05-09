; DESCRIPTION: Creates a yellow rectangular region at (479, 106) spanning 24 by 26 pixels.
; PLAN: r0=479(x), r1=106(y), r2=24(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 106
LDI r2, 24
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
