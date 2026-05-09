; DESCRIPTION: Creates a green rectangular region at (154, 206) spanning 33 by 14 pixels.
; PLAN: r0=154(x), r1=206(y), r2=33(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 206
LDI r2, 33
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
