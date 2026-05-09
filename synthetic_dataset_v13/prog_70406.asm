; DESCRIPTION: Composite: Places a cyan dot at position (11, 226) then Draws a yellow line from (291, 210) to (420, 189).
; PLAN: r0=11(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=291(x1), r6=210(y1), r7=420(x2), r8=189(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 291
LDI r6, 210
LDI r7, 420
LDI r8, 189
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
