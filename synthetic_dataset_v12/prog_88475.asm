; DESCRIPTION: Composite: Places a white dot at position (420, 84) then Draws a white line from (313, 206) to (124, 73).
; PLAN: r0=420(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=313(x1), r6=206(y1), r7=124(x2), r8=73(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 313
LDI r6, 206
LDI r7, 124
LDI r8, 73
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
