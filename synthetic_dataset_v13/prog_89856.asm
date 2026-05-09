; DESCRIPTION: Draws a cyan line from (407, 94) to (479, 59).
; PLAN: r0=407(x1), r1=94(y1), r2=479(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 94
LDI r2, 479
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
