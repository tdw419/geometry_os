; DESCRIPTION: Composite: Places a red dot at position (259, 252) then Places a white circle of radius 24 at center (271, 154).
; PLAN: r0=259(x), r1=252(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=154(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 252
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 271
LDI r6, 154
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
