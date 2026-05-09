; DESCRIPTION: Composite: Places a cyan dot at position (391, 124) then Renders a blue box of size 69x73 starting at (246, 91).
; PLAN: r0=391(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=91(y), r7=69(width), r8=73(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 91
LDI r7, 69
LDI r8, 73
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
