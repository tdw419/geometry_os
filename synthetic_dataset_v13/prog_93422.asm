; DESCRIPTION: Composite: Places a cyan dot at position (421, 208) then Renders a orange line between points (161, 209) and (326, 197).
; PLAN: r0=421(x), r1=208(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=209(y1), r7=326(x2), r8=197(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 208
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 209
LDI r7, 326
LDI r8, 197
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
