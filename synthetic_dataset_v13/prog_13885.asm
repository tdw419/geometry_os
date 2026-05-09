; DESCRIPTION: Draws a cyan line from (377, 27) to (146, 95).
; PLAN: r0=377(x1), r1=27(y1), r2=146(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 27
LDI r2, 146
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
