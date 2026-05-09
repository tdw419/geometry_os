; DESCRIPTION: Composite: Places a magenta dot at position (111, 145) then Places a blue 78x70 rectangle at position (369, 86).
; PLAN: r0=111(x), r1=145(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=86(y), r7=78(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 145
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 86
LDI r7, 78
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
