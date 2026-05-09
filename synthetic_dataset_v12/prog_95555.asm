; DESCRIPTION: Composite: Renders a green line between points (479, 176) and (16, 141) then Places a blue dot at position (190, 37).
; PLAN: r0=479(x1), r1=176(y1), r2=16(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=37(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 479
LDI r1, 176
LDI r2, 16
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 37
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
