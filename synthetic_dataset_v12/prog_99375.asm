; DESCRIPTION: Composite: Sets a single magenta pixel at (186, 80) then Places a white 110x28 rectangle at position (359, 153).
; PLAN: r0=186(x), r1=80(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=153(y), r7=110(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 80
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 153
LDI r7, 110
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
