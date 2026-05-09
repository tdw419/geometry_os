; DESCRIPTION: Composite: Sets a single purple pixel at (479, 220) then Renders a white box of size 110x14 starting at (24, 189).
; PLAN: r0=479(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=24(x), r6=189(y), r7=110(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 479
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 24
LDI r6, 189
LDI r7, 110
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
