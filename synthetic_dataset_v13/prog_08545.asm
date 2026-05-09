; DESCRIPTION: Creates a white rectangular region at (434, 180) spanning 71 by 40 pixels.
; PLAN: r0=434(x), r1=180(y), r2=71(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 180
LDI r2, 71
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
