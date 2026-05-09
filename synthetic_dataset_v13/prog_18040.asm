; DESCRIPTION: Composite: Places a cyan dot at position (132, 187) then Places a white 59x47 rectangle at position (292, 148).
; PLAN: r0=132(x), r1=187(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=148(y), r7=59(width), r8=47(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 187
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 148
LDI r7, 59
LDI r8, 47
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
