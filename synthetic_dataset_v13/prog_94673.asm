; DESCRIPTION: Renders a green line between points (178, 186) and (107, 228).
; PLAN: r0=178(x1), r1=186(y1), r2=107(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 186
LDI r2, 107
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
