; DESCRIPTION: Creates a black rectangular region at (156, 197) spanning 109 by 40 pixels.
; PLAN: r0=156(x), r1=197(y), r2=109(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 197
LDI r2, 109
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
