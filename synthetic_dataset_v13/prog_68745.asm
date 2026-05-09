; DESCRIPTION: Creates a red rectangular region at (77, 206) spanning 59 by 48 pixels.
; PLAN: r0=77(x), r1=206(y), r2=59(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 206
LDI r2, 59
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
