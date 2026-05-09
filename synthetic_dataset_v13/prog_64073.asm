; DESCRIPTION: Renders a red box of size 68x14 starting at (199, 225).
; PLAN: r0=199(x), r1=225(y), r2=68(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 225
LDI r2, 68
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
