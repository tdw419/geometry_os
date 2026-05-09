; DESCRIPTION: Composite: Places a magenta dot at position (369, 4) then Places a cyan 98x75 rectangle at position (266, 32).
; PLAN: r0=369(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=32(y), r7=98(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 266
LDI r6, 32
LDI r7, 98
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
