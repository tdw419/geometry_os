; DESCRIPTION: Renders a cyan line between points (464, 213) and (276, 35).
; PLAN: r0=464(x1), r1=213(y1), r2=276(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 213
LDI r2, 276
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
