; DESCRIPTION: Composite: Places a magenta dot at position (341, 169) then Renders a yellow box of size 120x95 starting at (271, 147).
; PLAN: r0=341(x), r1=169(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=147(y), r7=120(width), r8=95(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 169
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 147
LDI r7, 120
LDI r8, 95
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
