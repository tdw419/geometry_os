; DESCRIPTION: Creates a blue rectangular region at (284, 37) spanning 60 by 118 pixels.
; PLAN: r0=284(x), r1=37(y), r2=60(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 37
LDI r2, 60
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
