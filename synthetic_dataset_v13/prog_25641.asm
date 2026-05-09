; DESCRIPTION: Composite: Places a orange dot at position (200, 246) then Renders a yellow box of size 109x30 starting at (264, 169).
; PLAN: r0=200(x), r1=246(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=264(x), r6=169(y), r7=109(width), r8=30(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 200
LDI r1, 246
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 264
LDI r6, 169
LDI r7, 109
LDI r8, 30
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
