; DESCRIPTION: Composite: Places a yellow dot at position (192, 58) then Renders a blue box of size 116x54 starting at (379, 188).
; PLAN: r0=192(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=188(y), r7=116(width), r8=54(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 379
LDI r6, 188
LDI r7, 116
LDI r8, 54
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
