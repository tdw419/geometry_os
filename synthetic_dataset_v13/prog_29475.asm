; DESCRIPTION: Creates a red rectangular region at (422, 206) spanning 12 by 26 pixels.
; PLAN: r0=422(x), r1=206(y), r2=12(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 206
LDI r2, 12
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
