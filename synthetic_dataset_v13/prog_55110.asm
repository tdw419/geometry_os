; DESCRIPTION: Creates a black rectangular region at (393, 206) spanning 96 by 16 pixels.
; PLAN: r0=393(x), r1=206(y), r2=96(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 206
LDI r2, 96
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
