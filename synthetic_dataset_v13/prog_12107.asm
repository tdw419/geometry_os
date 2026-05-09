; DESCRIPTION: Creates a red rectangular region at (272, 166) spanning 25 by 67 pixels.
; PLAN: r0=272(x), r1=166(y), r2=25(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 166
LDI r2, 25
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
