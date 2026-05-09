; DESCRIPTION: Composite: Places a black dot at position (322, 209) then Draws a cyan line from (437, 113) to (401, 114).
; PLAN: r0=322(x), r1=209(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=437(x1), r6=113(y1), r7=401(x2), r8=114(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 209
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 437
LDI r6, 113
LDI r7, 401
LDI r8, 114
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
