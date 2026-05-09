; DESCRIPTION: Composite: Places a magenta dot at position (60, 53) then Draws a white line from (46, 35) to (291, 178).
; PLAN: r0=60(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=46(x1), r6=35(y1), r7=291(x2), r8=178(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 35
LDI r7, 291
LDI r8, 178
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
