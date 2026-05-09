; DESCRIPTION: Renders a yellow box of size 85x89 starting at (335, 109).
; PLAN: r0=335(x), r1=109(y), r2=85(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 109
LDI r2, 85
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
