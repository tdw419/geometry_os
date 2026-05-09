; DESCRIPTION: Composite: Renders a orange line between points (333, 122) and (65, 223) then Places a green dot at position (113, 228).
; PLAN: r0=333(x1), r1=122(y1), r2=65(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=228(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 122
LDI r2, 65
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 228
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
