; DESCRIPTION: Composite: Draws a cyan line from (127, 108) to (277, 228) then Places a green dot at position (302, 156).
; PLAN: r0=127(x1), r1=108(y1), r2=277(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=156(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 108
LDI r2, 277
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 156
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
