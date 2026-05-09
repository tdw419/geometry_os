; DESCRIPTION: Draws a cyan line from (32, 47) to (33, 57).
; PLAN: r0=32(x1), r1=47(y1), r2=33(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 47
LDI r2, 33
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
