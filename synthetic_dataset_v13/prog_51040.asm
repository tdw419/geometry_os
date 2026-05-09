; DESCRIPTION: Creates a yellow rectangular region at (279, 173) spanning 115 by 67 pixels.
; PLAN: r0=279(x), r1=173(y), r2=115(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 173
LDI r2, 115
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
