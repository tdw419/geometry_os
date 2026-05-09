; DESCRIPTION: Creates a green rectangular region at (443, 59) spanning 61 by 60 pixels.
; PLAN: r0=443(x), r1=59(y), r2=61(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 59
LDI r2, 61
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
