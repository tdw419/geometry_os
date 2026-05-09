; DESCRIPTION: Composite: Places a green dot at position (103, 204) then Places a red line segment connecting (444, 96) to (299, 207).
; PLAN: r0=103(x), r1=204(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=444(x1), r6=96(y1), r7=299(x2), r8=207(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 204
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 444
LDI r6, 96
LDI r7, 299
LDI r8, 207
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
