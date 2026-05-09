; DESCRIPTION: Creates a yellow rectangular region at (197, 140) spanning 47 by 75 pixels.
; PLAN: r0=197(x), r1=140(y), r2=47(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 140
LDI r2, 47
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
