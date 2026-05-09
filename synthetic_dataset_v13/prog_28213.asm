; DESCRIPTION: Creates a green rectangular region at (413, 180) spanning 48 by 41 pixels.
; PLAN: r0=413(x), r1=180(y), r2=48(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 180
LDI r2, 48
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
