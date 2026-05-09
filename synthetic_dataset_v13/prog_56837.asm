; DESCRIPTION: Creates a yellow rectangular region at (197, 35) spanning 91 by 32 pixels.
; PLAN: r0=197(x), r1=35(y), r2=91(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 35
LDI r2, 91
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
