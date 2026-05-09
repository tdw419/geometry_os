; DESCRIPTION: Renders a white box of size 44x17 starting at (180, 95).
; PLAN: r0=180(x), r1=95(y), r2=44(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 95
LDI r2, 44
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
