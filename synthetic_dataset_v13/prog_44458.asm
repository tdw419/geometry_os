; DESCRIPTION: Composite: Sets a single blue pixel at (124, 24) then Renders a white box of size 40x86 starting at (98, 154).
; PLAN: r0=124(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=154(y), r7=40(width), r8=86(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 154
LDI r7, 40
LDI r8, 86
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
