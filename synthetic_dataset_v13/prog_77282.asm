; DESCRIPTION: Renders a cyan line between points (46, 103) and (153, 195).
; PLAN: r0=46(x1), r1=103(y1), r2=153(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 103
LDI r2, 153
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
