; DESCRIPTION: Composite: Places a cyan dot at position (86, 82) then Draws a green line from (213, 222) to (110, 113).
; PLAN: r0=86(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=213(x1), r6=222(y1), r7=110(x2), r8=113(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 213
LDI r6, 222
LDI r7, 110
LDI r8, 113
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
