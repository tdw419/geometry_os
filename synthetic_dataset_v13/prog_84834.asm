; DESCRIPTION: Creates a yellow rectangular region at (479, 131) spanning 23 by 99 pixels.
; PLAN: r0=479(x), r1=131(y), r2=23(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 131
LDI r2, 23
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
