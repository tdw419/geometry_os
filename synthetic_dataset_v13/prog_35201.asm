; DESCRIPTION: Renders a cyan line between points (268, 41) and (257, 214).
; PLAN: r0=268(x1), r1=41(y1), r2=257(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 41
LDI r2, 257
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
