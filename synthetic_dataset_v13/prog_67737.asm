; DESCRIPTION: Renders a cyan line between points (387, 249) and (49, 236).
; PLAN: r0=387(x1), r1=249(y1), r2=49(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 249
LDI r2, 49
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
