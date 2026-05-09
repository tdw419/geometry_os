; DESCRIPTION: Draws a cyan line from (333, 180) to (197, 168).
; PLAN: r0=333(x1), r1=180(y1), r2=197(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 180
LDI r2, 197
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
