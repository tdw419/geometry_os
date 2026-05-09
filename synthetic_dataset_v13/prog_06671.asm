; DESCRIPTION: Creates a yellow rectangular region at (392, 206) spanning 30 by 29 pixels.
; PLAN: r0=392(x), r1=206(y), r2=30(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 206
LDI r2, 30
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
