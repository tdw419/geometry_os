; DESCRIPTION: Creates a black rectangular region at (197, 117) spanning 48 by 91 pixels.
; PLAN: r0=197(x), r1=117(y), r2=48(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 117
LDI r2, 48
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
