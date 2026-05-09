; DESCRIPTION: Composite: Places a yellow dot at position (418, 229) then Renders a cyan line between points (247, 67) and (234, 117).
; PLAN: r0=418(x), r1=229(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=67(y1), r7=234(x2), r8=117(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 229
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 247
LDI r6, 67
LDI r7, 234
LDI r8, 117
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
