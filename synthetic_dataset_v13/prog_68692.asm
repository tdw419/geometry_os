; DESCRIPTION: Places a red circle of radius 66 at center (284, 82).
; PLAN: r0=284(x), r1=82(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 82
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
