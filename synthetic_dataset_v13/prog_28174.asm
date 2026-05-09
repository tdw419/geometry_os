; DESCRIPTION: Renders a red box of size 21x64 starting at (259, 17).
; PLAN: r0=259(x), r1=17(y), r2=21(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 17
LDI r2, 21
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
