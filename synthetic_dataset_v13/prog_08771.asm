; DESCRIPTION: Draws a cyan line from (479, 57) to (120, 251).
; PLAN: r0=479(x1), r1=57(y1), r2=120(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 57
LDI r2, 120
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
