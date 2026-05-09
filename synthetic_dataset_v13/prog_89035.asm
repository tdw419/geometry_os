; DESCRIPTION: Composite: Renders a green line between points (135, 171) and (292, 113) then Places a green dot at position (386, 161).
; PLAN: r0=135(x1), r1=171(y1), r2=292(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=386(x), r6=161(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 171
LDI r2, 292
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 161
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
