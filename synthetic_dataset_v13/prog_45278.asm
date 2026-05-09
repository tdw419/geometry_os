; DESCRIPTION: Renders a red box of size 84x97 starting at (328, 120).
; PLAN: r0=328(x), r1=120(y), r2=84(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 120
LDI r2, 84
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
