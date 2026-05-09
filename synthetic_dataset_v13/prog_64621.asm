; DESCRIPTION: Composite: Places a purple dot at position (284, 106) then Renders a blue box of size 117x92 starting at (20, 155).
; PLAN: r0=284(x), r1=106(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=155(y), r7=117(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 106
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 20
LDI r6, 155
LDI r7, 117
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
