; DESCRIPTION: Renders a black line between points (380, 197) and (494, 174).
; PLAN: r0=380(x1), r1=197(y1), r2=494(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 197
LDI r2, 494
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
