; DESCRIPTION: Composite: Places a red dot at position (369, 10) then Places a orange 22x111 rectangle at position (66, 23).
; PLAN: r0=369(x), r1=10(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=23(y), r7=22(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 10
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 66
LDI r6, 23
LDI r7, 22
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
