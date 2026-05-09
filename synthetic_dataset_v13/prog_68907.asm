; DESCRIPTION: Draws a cyan line from (212, 98) to (168, 6).
; PLAN: r0=212(x1), r1=98(y1), r2=168(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 98
LDI r2, 168
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
