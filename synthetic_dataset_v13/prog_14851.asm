; DESCRIPTION: Creates a white rectangular region at (404, 34) spanning 54 by 13 pixels.
; PLAN: r0=404(x), r1=34(y), r2=54(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 34
LDI r2, 54
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
