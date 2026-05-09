; DESCRIPTION: Draws a cyan line from (479, 174) to (171, 52).
; PLAN: r0=479(x1), r1=174(y1), r2=171(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 174
LDI r2, 171
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
