; DESCRIPTION: Renders a red box of size 97x48 starting at (240, 179).
; PLAN: r0=240(x), r1=179(y), r2=97(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 179
LDI r2, 97
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
