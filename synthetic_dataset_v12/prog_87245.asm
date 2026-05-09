; DESCRIPTION: Creates a yellow rectangular region at (284, 109) spanning 52 by 91 pixels.
; PLAN: r0=284(x), r1=109(y), r2=52(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 109
LDI r2, 52
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
