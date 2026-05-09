; DESCRIPTION: Composite: Places a white dot at position (120, 35) then Renders a green box of size 16x78 starting at (90, 142).
; PLAN: r0=120(x), r1=35(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=142(y), r7=16(width), r8=78(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 35
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 90
LDI r6, 142
LDI r7, 16
LDI r8, 78
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
