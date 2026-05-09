; DESCRIPTION: Creates a yellow rectangular region at (284, 139) spanning 49 by 103 pixels.
; PLAN: r0=284(x), r1=139(y), r2=49(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 139
LDI r2, 49
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
