; DESCRIPTION: Renders a red box of size 96x64 starting at (236, 44).
; PLAN: r0=236(x), r1=44(y), r2=96(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 44
LDI r2, 96
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
