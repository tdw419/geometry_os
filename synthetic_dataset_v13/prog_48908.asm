; DESCRIPTION: Composite: Renders a cyan line between points (492, 123) and (168, 132) then Places a black dot at position (240, 99).
; PLAN: r0=492(x1), r1=123(y1), r2=168(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=99(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 492
LDI r1, 123
LDI r2, 168
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 99
LDI r7, 0x000000
PSET r5, r6, r7
HALT
