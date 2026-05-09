; DESCRIPTION: Draws a cyan line from (80, 135) to (20, 255).
; PLAN: r0=80(x1), r1=135(y1), r2=20(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 135
LDI r2, 20
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
