; DESCRIPTION: Creates a red rectangular region at (422, 30) spanning 67 by 103 pixels.
; PLAN: r0=422(x), r1=30(y), r2=67(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 30
LDI r2, 67
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
