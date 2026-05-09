; DESCRIPTION: Composite: Places a blue dot at position (199, 113) then Draws a red line from (479, 164) to (377, 143).
; PLAN: r0=199(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=479(x1), r6=164(y1), r7=377(x2), r8=143(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 479
LDI r6, 164
LDI r7, 377
LDI r8, 143
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
