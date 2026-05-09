; DESCRIPTION: Creates a yellow rectangular region at (284, 9) spanning 36 by 89 pixels.
; PLAN: r0=284(x), r1=9(y), r2=36(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 9
LDI r2, 36
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
