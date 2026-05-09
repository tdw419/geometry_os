; DESCRIPTION: Creates a green rectangular region at (320, 180) spanning 82 by 12 pixels.
; PLAN: r0=320(x), r1=180(y), r2=82(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 180
LDI r2, 82
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
