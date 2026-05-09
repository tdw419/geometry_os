; DESCRIPTION: Draws a cyan line from (309, 38) to (299, 243).
; PLAN: r0=309(x1), r1=38(y1), r2=299(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 38
LDI r2, 299
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
