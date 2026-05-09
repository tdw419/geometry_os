; DESCRIPTION: Composite: Renders a blue line between points (502, 51) and (439, 186) then Places a yellow dot at position (213, 193).
; PLAN: r0=502(x1), r1=51(y1), r2=439(x2), r3=186(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 502
LDI r1, 51
LDI r2, 439
LDI r3, 186
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
