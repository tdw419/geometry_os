; DESCRIPTION: Places a red circle of radius 34 at center (195, 215).
; PLAN: r0=195(x), r1=215(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 215
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
