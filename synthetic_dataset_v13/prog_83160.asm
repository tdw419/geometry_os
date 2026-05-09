; DESCRIPTION: Renders a red box of size 96x109 starting at (143, 117).
; PLAN: r0=143(x), r1=117(y), r2=96(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 117
LDI r2, 96
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
