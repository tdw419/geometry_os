; DESCRIPTION: Composite: Places a green dot at position (66, 199) then Draws a white line from (445, 11) to (502, 39).
; PLAN: r0=66(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=11(y1), r7=502(x2), r8=39(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 445
LDI r6, 11
LDI r7, 502
LDI r8, 39
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
