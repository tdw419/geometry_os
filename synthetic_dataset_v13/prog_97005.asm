; DESCRIPTION: Composite: Places a cyan dot at position (170, 131) then Draws a yellow rectangle at (253, 208) with width 15 and height 46.
; PLAN: r0=170(x), r1=131(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=253(x), r6=208(y), r7=15(width), r8=46(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 131
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 253
LDI r6, 208
LDI r7, 15
LDI r8, 46
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
