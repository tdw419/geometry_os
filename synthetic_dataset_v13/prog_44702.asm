; DESCRIPTION: Renders a cyan line between points (275, 114) and (107, 172).
; PLAN: r0=275(x1), r1=114(y1), r2=107(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 114
LDI r2, 107
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
