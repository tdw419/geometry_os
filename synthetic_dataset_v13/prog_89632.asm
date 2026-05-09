; DESCRIPTION: Composite: Places a blue dot at position (222, 166) then Places a cyan line segment connecting (412, 172) to (295, 181).
; PLAN: r0=222(x), r1=166(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=412(x1), r6=172(y1), r7=295(x2), r8=181(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 222
LDI r1, 166
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 172
LDI r7, 295
LDI r8, 181
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
