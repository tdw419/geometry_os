; DESCRIPTION: Composite: Places a red dot at position (211, 229) then Places a orange 89x111 rectangle at position (302, 36).
; PLAN: r0=211(x), r1=229(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=302(x), r6=36(y), r7=89(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 229
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 302
LDI r6, 36
LDI r7, 89
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
