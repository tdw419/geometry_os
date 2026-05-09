; DESCRIPTION: Draws a cyan line from (365, 115) to (16, 180).
; PLAN: r0=365(x1), r1=115(y1), r2=16(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 115
LDI r2, 16
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
