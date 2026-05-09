; DESCRIPTION: Creates a red circular shape at (215, 212) with radius 38.
; PLAN: r0=215(x), r1=212(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 212
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
