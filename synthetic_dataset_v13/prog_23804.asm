; DESCRIPTION: Renders a cyan line between points (290, 162) and (479, 142).
; PLAN: r0=290(x1), r1=162(y1), r2=479(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 162
LDI r2, 479
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
