; DESCRIPTION: Composite: Draws a yellow line from (313, 202) to (263, 53) then Places a white dot at position (152, 218).
; PLAN: r0=313(x1), r1=202(y1), r2=263(x2), r3=53(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=218(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 202
LDI r2, 263
LDI r3, 53
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 218
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
