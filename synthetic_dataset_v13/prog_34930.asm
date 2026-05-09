; DESCRIPTION: Composite: Sets a single red pixel at (242, 98) then Draws a red rectangle at (82, 74) with width 91 and height 117.
; PLAN: r0=242(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=74(y), r7=91(width), r8=117(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 82
LDI r6, 74
LDI r7, 91
LDI r8, 117
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
