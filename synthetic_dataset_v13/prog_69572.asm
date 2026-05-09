; DESCRIPTION: Composite: Places a blue dot at position (250, 154) then Renders a white box of size 99x15 starting at (297, 4).
; PLAN: r0=250(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=297(x), r6=4(y), r7=99(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 250
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 297
LDI r6, 4
LDI r7, 99
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
