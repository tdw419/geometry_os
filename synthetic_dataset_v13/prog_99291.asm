; DESCRIPTION: Renders a cyan line between points (479, 41) and (265, 237).
; PLAN: r0=479(x1), r1=41(y1), r2=265(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 41
LDI r2, 265
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
