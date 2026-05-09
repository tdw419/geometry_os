; DESCRIPTION: Renders a red box of size 75x106 starting at (255, 91).
; PLAN: r0=255(x), r1=91(y), r2=75(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 91
LDI r2, 75
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
