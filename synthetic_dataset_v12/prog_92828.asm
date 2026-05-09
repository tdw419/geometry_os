; DESCRIPTION: Renders a red box of size 17x86 starting at (360, 21).
; PLAN: r0=360(x), r1=21(y), r2=17(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 21
LDI r2, 17
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
