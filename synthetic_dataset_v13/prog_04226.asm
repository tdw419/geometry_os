; DESCRIPTION: Creates a red rectangular region at (206, 86) spanning 104 by 54 pixels.
; PLAN: r0=206(x), r1=86(y), r2=104(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 86
LDI r2, 104
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
