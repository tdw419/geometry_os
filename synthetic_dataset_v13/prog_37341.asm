; DESCRIPTION: Draws a cyan line from (479, 233) to (133, 27).
; PLAN: r0=479(x1), r1=233(y1), r2=133(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 233
LDI r2, 133
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
