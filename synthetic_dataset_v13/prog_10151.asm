; DESCRIPTION: Draws a cyan line from (95, 106) to (386, 28).
; PLAN: r0=95(x1), r1=106(y1), r2=386(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 106
LDI r2, 386
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
