; DESCRIPTION: Composite: Draws a red line from (502, 142) to (352, 225) then Places a green dot at position (406, 26).
; PLAN: r0=502(x1), r1=142(y1), r2=352(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=26(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 502
LDI r1, 142
LDI r2, 352
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 26
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
