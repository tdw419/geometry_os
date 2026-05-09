; DESCRIPTION: Renders a red box of size 64x96 starting at (248, 91).
; PLAN: r0=248(x), r1=91(y), r2=64(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 91
LDI r2, 64
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
