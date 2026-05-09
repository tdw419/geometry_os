; DESCRIPTION: Creates a green rectangular region at (415, 180) spanning 26 by 47 pixels.
; PLAN: r0=415(x), r1=180(y), r2=26(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 180
LDI r2, 26
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
