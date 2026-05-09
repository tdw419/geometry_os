; DESCRIPTION: Composite: Places a yellow dot at position (290, 233) then Draws a magenta line from (502, 27) to (76, 194).
; PLAN: r0=290(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=27(y1), r7=76(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 502
LDI r6, 27
LDI r7, 76
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
