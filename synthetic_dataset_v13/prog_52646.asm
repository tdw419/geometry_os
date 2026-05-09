; DESCRIPTION: Renders a red box of size 110x64 starting at (36, 186).
; PLAN: r0=36(x), r1=186(y), r2=110(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 186
LDI r2, 110
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
