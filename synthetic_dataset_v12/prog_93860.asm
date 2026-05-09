; DESCRIPTION: Composite: Places a white 80x52 rectangle at position (216, 129) then Sets a single green pixel at (472, 154).
; PLAN: r0=216(x), r1=129(y), r2=80(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=154(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 216
LDI r1, 129
LDI r2, 80
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 154
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
