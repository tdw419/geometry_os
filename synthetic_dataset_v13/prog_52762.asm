; DESCRIPTION: Draws a cyan line from (106, 14) to (479, 108).
; PLAN: r0=106(x1), r1=14(y1), r2=479(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 14
LDI r2, 479
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
