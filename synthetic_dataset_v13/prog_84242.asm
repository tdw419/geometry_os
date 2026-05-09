; DESCRIPTION: Renders a cyan line between points (39, 249) and (502, 70).
; PLAN: r0=39(x1), r1=249(y1), r2=502(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 249
LDI r2, 502
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
