; DESCRIPTION: Composite: Places a cyan dot at position (328, 24) then Draws a cyan line from (360, 211) to (262, 117).
; PLAN: r0=328(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=360(x1), r6=211(y1), r7=262(x2), r8=117(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 211
LDI r7, 262
LDI r8, 117
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
