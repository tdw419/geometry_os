; DESCRIPTION: Places a white circle of radius 70 at center (95, 111).
; PLAN: r0=95(x), r1=111(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 111
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
