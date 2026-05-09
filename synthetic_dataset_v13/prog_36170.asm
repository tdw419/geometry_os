; DESCRIPTION: Composite: Places a blue 107x75 rectangle at position (306, 150) then Places a red dot at position (298, 109).
; PLAN: r0=306(x), r1=150(y), r2=107(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 150
LDI r2, 107
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
