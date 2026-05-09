; DESCRIPTION: Draws a cyan line from (466, 126) to (217, 57).
; PLAN: r0=466(x1), r1=126(y1), r2=217(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 126
LDI r2, 217
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
