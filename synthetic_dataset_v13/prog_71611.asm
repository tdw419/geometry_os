; DESCRIPTION: Draws a cyan line from (429, 12) to (168, 9).
; PLAN: r0=429(x1), r1=12(y1), r2=168(x2), r3=9(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 12
LDI r2, 168
LDI r3, 9
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
