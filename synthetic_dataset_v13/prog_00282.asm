; DESCRIPTION: Composite: Places a magenta line segment connecting (471, 33) to (117, 93) then Places a white dot at position (301, 113).
; PLAN: r0=471(x1), r1=33(y1), r2=117(x2), r3=93(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=113(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 471
LDI r1, 33
LDI r2, 117
LDI r3, 93
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 113
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
