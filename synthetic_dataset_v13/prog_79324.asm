; DESCRIPTION: Creates a red rectangular region at (304, 206) spanning 33 by 19 pixels.
; PLAN: r0=304(x), r1=206(y), r2=33(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 206
LDI r2, 33
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
