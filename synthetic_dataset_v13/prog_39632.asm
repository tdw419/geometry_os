; DESCRIPTION: Draws a cyan line from (79, 48) to (135, 20).
; PLAN: r0=79(x1), r1=48(y1), r2=135(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 48
LDI r2, 135
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
