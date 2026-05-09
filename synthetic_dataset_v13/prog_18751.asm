; DESCRIPTION: Creates a yellow rectangular region at (165, 231) spanning 103 by 22 pixels.
; PLAN: r0=165(x), r1=231(y), r2=103(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 231
LDI r2, 103
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
