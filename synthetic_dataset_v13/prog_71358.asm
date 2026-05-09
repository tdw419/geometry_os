; DESCRIPTION: Composite: Sets a single red pixel at (216, 187) then Places a green 74x115 rectangle at position (171, 74).
; PLAN: r0=216(x), r1=187(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=171(x), r6=74(y), r7=74(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 187
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 171
LDI r6, 74
LDI r7, 74
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
