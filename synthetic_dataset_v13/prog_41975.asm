; DESCRIPTION: Composite: Places a orange dot at position (269, 138) then Renders a cyan line between points (495, 230) and (329, 113).
; PLAN: r0=269(x), r1=138(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=230(y1), r7=329(x2), r8=113(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 138
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 495
LDI r6, 230
LDI r7, 329
LDI r8, 113
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
