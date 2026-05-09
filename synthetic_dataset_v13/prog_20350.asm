; DESCRIPTION: Places a orange circle of radius 72 at center (404, 120).
; PLAN: r0=404(x), r1=120(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 404
LDI r1, 120
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
