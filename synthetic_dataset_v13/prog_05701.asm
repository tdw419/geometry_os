; DESCRIPTION: Creates a orange rectangular region at (197, 8) spanning 17 by 83 pixels.
; PLAN: r0=197(x), r1=8(y), r2=17(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 8
LDI r2, 17
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
