; DESCRIPTION: Creates a yellow rectangular region at (365, 197) spanning 40 by 23 pixels.
; PLAN: r0=365(x), r1=197(y), r2=40(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 197
LDI r2, 40
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
