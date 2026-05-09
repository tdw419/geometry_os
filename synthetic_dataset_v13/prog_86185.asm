; DESCRIPTION: Composite: Places a orange dot at position (507, 128) then Draws a cyan line from (396, 54) to (470, 138).
; PLAN: r0=507(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=396(x1), r6=54(y1), r7=470(x2), r8=138(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 507
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 396
LDI r6, 54
LDI r7, 470
LDI r8, 138
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
