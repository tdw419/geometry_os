; DESCRIPTION: Composite: Places a cyan line segment connecting (410, 117) to (403, 232) then Places a magenta dot at position (399, 108).
; PLAN: r0=410(x1), r1=117(y1), r2=403(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=108(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 117
LDI r2, 403
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 108
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
