; DESCRIPTION: Renders a cyan line between points (465, 53) and (479, 234).
; PLAN: r0=465(x1), r1=53(y1), r2=479(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 53
LDI r2, 479
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
