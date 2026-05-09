; DESCRIPTION: Places a red circle of radius 60 at center (443, 68).
; PLAN: r0=443(x), r1=68(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 68
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
