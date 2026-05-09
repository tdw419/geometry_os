; DESCRIPTION: Creates a black rectangular region at (146, 16) spanning 90 by 58 pixels.
; PLAN: r0=146(x), r1=16(y), r2=90(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 16
LDI r2, 90
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
