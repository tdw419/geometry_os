; DESCRIPTION: Draws a cyan line from (479, 26) to (169, 40).
; PLAN: r0=479(x1), r1=26(y1), r2=169(x2), r3=40(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 26
LDI r2, 169
LDI r3, 40
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
