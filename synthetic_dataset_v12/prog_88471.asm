; DESCRIPTION: Creates a red rectangular region at (302, 206) spanning 89 by 33 pixels.
; PLAN: r0=302(x), r1=206(y), r2=89(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 206
LDI r2, 89
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
