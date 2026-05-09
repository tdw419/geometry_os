; DESCRIPTION: Creates a white rectangular region at (362, 103) spanning 21 by 68 pixels.
; PLAN: r0=362(x), r1=103(y), r2=21(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 103
LDI r2, 21
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
