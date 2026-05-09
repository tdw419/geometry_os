; DESCRIPTION: Draws a cyan line from (197, 120) to (75, 210).
; PLAN: r0=197(x1), r1=120(y1), r2=75(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 120
LDI r2, 75
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
