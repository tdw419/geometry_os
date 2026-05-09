; DESCRIPTION: Composite: Sets a single purple pixel at (35, 133) then Places a red 27x80 rectangle at position (130, 94).
; PLAN: r0=35(x), r1=133(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=94(y), r7=27(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 133
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 94
LDI r7, 27
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
