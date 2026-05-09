; DESCRIPTION: Renders a red box of size 31x61 starting at (199, 64).
; PLAN: r0=199(x), r1=64(y), r2=31(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 64
LDI r2, 31
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
