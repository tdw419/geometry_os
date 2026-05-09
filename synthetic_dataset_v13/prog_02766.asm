; DESCRIPTION: Creates a green rectangular region at (317, 239) spanning 26 by 15 pixels.
; PLAN: r0=317(x), r1=239(y), r2=26(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 239
LDI r2, 26
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
