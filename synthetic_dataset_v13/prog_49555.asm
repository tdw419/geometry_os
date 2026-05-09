; DESCRIPTION: Draws a cyan line from (154, 99) to (120, 180).
; PLAN: r0=154(x1), r1=99(y1), r2=120(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 99
LDI r2, 120
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
